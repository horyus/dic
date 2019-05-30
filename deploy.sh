#! /bin/bash

./pre_install.sh

helm upgrade $HELM_RELEASE_NAME . -f ./values.yaml -f ./values/nexus/values.yaml -f ./values/jira/values.yaml --set letsencrypt.server=$CA_SERVER_URL
