# Development Infrastructure Charts

# Requirements

- `helm` & `kubectl`
- Cluster on GKE, kubectl using this clster's context
- public global static ip not in use and called `noss-public`
- public global static ip not in use and called `jira-public`
- `nexus.horyus.com` points to `noss-public`
- `jira.horyus.com` points to `jira-public`

# Install

## Init

```shell
./init.sh
```

This script sets up RBAC service account for Tiller and starts the Tiller pod.

## Pre Install

```shell
./pre_install.sh
```

This script loads the Custom Resource Definitions, and creates the cert manager namespace / pods if they don't exist

## Install

```shell
helm install . \
    -f ./values.yaml \
    -f ./values/nexus/values.yaml \
    -f ./values/jira/values.yaml \
    --set letsencrypt.server=https://acme-v02.api.letsencrypt.org/directory
```

Will start everything up. You can set the letsencrypt server to staging if needed
