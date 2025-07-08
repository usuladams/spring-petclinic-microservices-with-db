#!/bin/bash

CLUSTER_NAME="zeus-cluster"
REGION="us-west3"
ZONE="us-west3-a, us-west3-b, us-west3-c"
NUM_NODES=1
DISK_SIZE="30GB"
MACHINE_TYPE="e2-medium"

echo "Creating GKE cluster: $CLUSTER_NAME in $REGION ($ZONE)..."

gcloud container clusters create $CLUSTER_NAME \
    --location $REGION \
    --node-locations $ZONE \
    --machine-type $MACHINE_TYPE \
    --disk-size $DISK_SIZE \
    --num-nodes $NUM_NODES

echo "Cluster $CLUSTER_NAME creation complete!"