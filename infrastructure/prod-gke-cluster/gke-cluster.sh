#!/bin/bash

CLUSTER_NAME="zeus-cluster"
REGION="us-east1"
ZONE="us-east1-b,us-east1-c,us-east1-d"
NUM_NODES=1
DISK_SIZE="50GB"
MACHINE_TYPE="n1-standard-2"

echo "Checking if cluster '$CLUSTER_NAME' exists in region '$REGION'..."

EXISTING_CLUSTER=$(gcloud container clusters list --region "$REGION" --filter="name=$CLUSTER_NAME" --format="value(name)")

if [ "$EXISTING_CLUSTER" == "$CLUSTER_NAME" ]; then
    echo "Cluster '$CLUSTER_NAME' already exists."
    # Cluster durumu kontrolü
    STATUS=$(gcloud container clusters describe "$CLUSTER_NAME" --region "$REGION" --format="value(status)")
    echo "Cluster status: $STATUS"
    if [ "$STATUS" == "RUNNING" ]; then
        echo "Cluster is already running. No action needed."
    else
        echo "Cluster is not running. You may want to investigate."
    fi
else
    echo "Cluster '$CLUSTER_NAME' does not exist. Creating cluster..."
    gcloud container clusters create "$CLUSTER_NAME" \
        --location "$REGION" \
        --node-locations "$ZONE" \
        --machine-type "$MACHINE_TYPE" \
        --disk-size "$DISK_SIZE" \
        --num-nodes "$NUM_NODES" \
          --service-account=jenkins-cd@k8s-demo-464210.iam.gserviceaccount.com 

    if [ $? -eq 0 ]; then
        echo "Cluster '$CLUSTER_NAME' creation complete and running!"
    else
        echo "Failed to create cluster '$CLUSTER_NAME'."
        exit 1
    fi
fi
