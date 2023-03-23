# K8S Helm
Helm charts example for micro services

## Setup
* Setup cluster (Terraform in progress)
* Run `make deploy-all`

## features
* [x] Hel charts
* [x] ArgoCD
* [x] Prometheus Stack
* [x] Manage different environments using values
* [ ] Vault
* [ ] AWS KMS
* [ ] Terraform
* [ ] Auto setup script

## How CD works
1. Github action of each service will push the docker image then will update its corresponding values in this repo. [example](https://github.com/osamaesmail/k8s-api/blob/master/.github/workflows/ci.yaml)
2. ArgoCD will watch the changes & deploy

