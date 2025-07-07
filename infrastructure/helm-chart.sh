helm package petclinic_chart/ 
helm push my-chart-0.1.0.tgz oci://LOCATION-docker.pkg.dev/PROJECT/REPOSITORY
gcloud artifacts docker images list europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts

helm push petclinic_chart-7.tgz oci://europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts



helm upgrade --install \
    petclinic-app-release oci://${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${HELM_CHART_REPO_NAME}/petclinic_chart \
    --version ${BUILD_NUMBER} --namespace petclinic-dev

europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart

helm pull oci://europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart --version 7



europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart@sha256:6ed8dc8b920918833a2da5869cea79427c257d943dcb4fa3a1510cf2bd3fd099
helm pull oci://europe-west3-docker.pkg.dev/PROJECT-ID/REPOSITORY/CHART_NAME --version x.y.z


docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart:7

helm upgrade --install \
    petclinic-app-release oci://europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart \
    --version 7 --namespace petclinic-
    
helm install petclinic-app-release ./petclinic_chart-7.tgz --namespace petclinic-dev --create-namespace



"${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${APP_REPO_NAME}"

gcloud config set project k8s-demo-464210


helm upgrade --install \
        petclinic-app-release  --version ${BUILD_NUMBER} \
        --namespace petclinic-dev


helm push petclinic_chart-${BUILD_NUMBER}.tgz oci://${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${HELM_CHART_REPO_NAME}/


kubectl create secret docker-registry gcp-artifact-registry -n petclinic-dev \
    --docker-server=europe-west3-docker.pkg.dev \
    --docker-username=_json_key \
    --docker-password=${GOOGLE_APPLICATION_CREDENTIALS}\
    --docker-email=usul.adem@gmail.com    


kubectl create secret docker-registry gcp-artifact-registry -n petclinic-dev \
    --docker-server=europe-west3-docker.pkg.dev \
    --docker-username=_json_key \
    --docker-password="$(cat key.json)" \
    --docker-email=usul.adem@gmail.com    


gcloud auth activate-service-account --key-file="$(cat key.json)"



europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev



europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:visits-service-v3.4.1-b10

docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:vets-service-v3.4.1-
    
    docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:discovery-server-v3.4.1-b10


    docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:customers-service-v3.4.1-b10

docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:config-server-v3.4.1-b10

    docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:api-gateway-v3.4.1-b10

    docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:admin-server-v3.4.1-b10


    docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:grafana-service

    docker pull \
    europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:prometheus-service



curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
gcloud auth activate-service-account --key-file=key.json


helm pull oci://europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart --version 7


helm upgrade --install     petclinic-app-release oci://europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts/petclinic_chart     --version 7 --namespace petclinic-dev


      kubectl create secret docker-registry gcp-artifact-registry -n petclinic-dev \
          --docker-server=${LOCATION}-docker.pkg.dev \
          --docker-username=_json_key \
          --docker-password=${GCP_KEY_JSON} \
          --docker-email=usul.adem@gmail.com    


kubectl create secret docker-registry gcp-artifact-registry2 -n default \
  --docker-server=europe-west3-docker.pkg.dev \
  --docker-username=_json_key \
  --docker-password="$(cat /tmp/gcp-sa.json)" \
  --docker-email=usul.adem@gmail.com


kubectl run test5 \
  --image=europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-app-dev/petclinic-app-dev:visits-service-v3.4.1-b20 \
  --image-pull-policy=Always \
  --overrides='
  {
    "spec": {
      "imagePullSecrets": [
        {
          "name": "gcp-artifact-registry2"
        }
      ]
    }
  }'
