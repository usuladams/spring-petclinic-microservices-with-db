echo 'Deploying App on Kubernetes'
envsubst < k8s/petclinic_chart/values-template.yaml > k8s/petclinic_chart/values.yaml
sed -i s/HELM_VERSION/${BUILD_NUMBER}/ k8s/petclinic_chart/Chart.yaml

helm package k8s/petclinic_chart
helm push petclinic_chart-${BUILD_NUMBER}.tgz oci://${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${HELM_CHART_REPO_NAME}

kubectl create ns petclinic-qa || echo "namespace petclinic-qa already exists"
kubectl delete secret gcp-artifact-registry -n petclinic-qa || echo "there is no gcp-artifact-registry secret in petclinic-qa namespace"

kubectl create secret docker-registry gcp-artifact-registry -n petclinic-dev \
    --docker-server=${LOCATION}-docker.pkg.dev \
    --docker-username=_json_key \
    --docker-password=$GOOGLE_APPLICATION_CREDENTIALS\
    --docker-email=usul.adem@gmail.com   

helm upgrade --install \
    petclinic-app-release oci://${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${HELM_CHART_REPO_NAME}/petclinic_chart \
    --version ${BUILD_NUMBER} --namespace petclinic-dev
