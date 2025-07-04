APP_REPO_NAME="petclinic-app-dev"
LOCATION="europe-west3"

gcloud artifacts repositories describe ${APP_REPO_NAME} --location=${LOCATION} > /dev/null 2>&1 \
            && echo "Artifact Repo '${APP_REPO_NAME}' already exists." \
            || (echo "Creating Artifact Repo '${APP_REPO_NAME}'..." && \
            gcloud artifacts repositories create ${APP_REPO_NAME} \
              --repository-format=docker \
              --location="${LOCATION}" \
              --description="GCP Repo for petclinic app" \
              --immutable-tags \
              --async \
              --disable-vulnerability-scanning)