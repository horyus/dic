#! /bin/bash

# Create Service Account
kubectl create -f ./rbac/rbac.yaml

# Initialize helm
helm init --service-account tiller --history-max 200
