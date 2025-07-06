helm package petclinic_chart/ 
helm push my-chart-0.1.0.tgz oci://LOCATION-docker.pkg.dev/PROJECT/REPOSITORY
gcloud artifacts docker images list europe-west3-docker.pkg.dev/k8s-demo-464210/petclinic-helm-charts
