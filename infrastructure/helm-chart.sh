helm package petclinic_chart/ 
helm push my-chart-0.1.0.tgz oci://LOCATION-docker.pkg.dev/PROJECT/REPOSITORY
gcloud artifacts docker images list europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts

helm push petclinic_chart-0.0.1.tgz oci://europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts



helm upgrade --install \
    petclinic-app-release oci://${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${HELM_CHART_REPO_NAME}/petclinic_chart \
    --version ${BUILD_NUMBER} --namespace petclinic-dev



"${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${APP_REPO_NAME}"



helm upgrade --install \
        petclinic-app-release  --version ${BUILD_NUMBER} \
        --namespace petclinic-dev


helm push petclinic_chart-${BUILD_NUMBER}.tgz oci://${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${HELM_CHART_REPO_NAME}/