# Development Infrastructure Charts

# Requirements

- `helm` & `kubectl`
- Cluster on GKE, kubectl using this cluster's context
- public global static ip not in use and called `noss-public`
- `nexus.ticket721.com` points to `noss-public`
- Project, cluster & service key on gcloud (and API enabled)
- Compute Engine Disk called jira-persistent on same region

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

## Travis

| Var | Desc |
| :---: | :---: |
| `CA_SERVER_URL` | URL of the CA server, ex: `https://acme-v02.api.letsencrypt.org/directory` |
| `CLOUDSDK_CORE_DISABLE_PROMPTS` | Disables interactivity in the gcloud CLI |
| `GOOGLE_CLUSTER_NAME` | Name of the cluster to operate |
| `GOOGLE_COMPUTE_ZONE` | Name of the zone |
| `GOOGLE_PROJECT_ID` | ID of the project containing the cluster |
| `GOOGLE_SERVICE_KEY` | JSON Service key, with `'` around it |
| `HELM_RELEASE_NAME` | Name of the current release |
| `HELM_VERSION` | Version of the Helm CLI |
