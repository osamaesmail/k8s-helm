.PHONY: help deploy-api deploy-ingress deploy-argo-cd deploy-argo deploy-argo-projects deploy-monitoring
.DEFAULT: help # Running Make will run the help target

help: ## Show Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deploy-api:
	helm upgrade --install api api

deploy-ingress: ## Deploy ingress
	helm upgrade --install ingress-nginx ingress-nginx \
 	--namespace ingress-nginx --create-namespace --values ingress-nginx-values.yaml

deploy-argo-cd: ## Deploy argo
	helm upgrade --install argocd argo-cd \
 	--namespace argo-cd --create-namespace --values argo-cd-values.yaml

deploy-argo: ## Deploy argo apps
	kubectl apply -f argo

deploy-argo-projects: ## Deploy argo projects
	kubectl apply -f argo-projects

deploy-monitoring: ## Deploy ingress
	helm upgrade --install kube-prometheus-stack kube-prometheus-stack \
 	--namespace kube-prometheus-stack --create-namespace --values kube-prometheus-stack-values.yaml

deploy-all: ## Deploy all dependencies
	make deploy-ingress && make deploy-argo-cd && make deploy-argo && make deploy-argo-projects && make deploy-monitoring
