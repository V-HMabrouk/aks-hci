#!/bin/bash

AZ_K8S_EXTENSION_VERSION='1.2.2'
AZ_CONNECTED_K8S_VERSION='1.2.8'

az extension add --name connectedk8s --version $AZ_CONNECTED_K8S_VERSION
az extension add --name k8s-extension --version $AZ_K8S_EXTENSION_VERSION
az k8s-extension create --name "arcml-extension" --extension-type Microsoft.AzureML.Kubernetes --config enableTraining=True enableInference=True inferenceRouterServiceType=loadBalancer allowInsecureConnections=True inferenceLoadBalancerHA=False --cluster-type connectedClusters --cluster-name $AML_CLUSTER_NAME --resource-group $AML_RESOURCE_GROUP --scope cluster
