USER_NAME=tzuhsuanhuang

build: build-client build-api
.PHONY: build

push: push-client push-api
.PHONY: push

.PHONY: apply-minikube
apply-minikube:
	kubectl apply -f k8s/minikube

.PHONY: delete-minikube
delete-minikube:
	kubectl delete -f k8s/minikube

##########
# client #
##########

.PHONY: build-client
build-client:
	docker build -t $(USER_NAME)/saurl-client client/.

.PHONY: push-client
push-client:
	docker push $(USER_NAME)/saurl-client

.PHONY: apply-minikube-client
apply-minikube-client:
	kubectl apply -f k8s/minikube/client.yml

.PHONY: delete-minikube-client
delete-minikube-client:
	kubectl delete -f k8s/minikube/client.yml

#######
# api #
#######

.PHONY: build-api
build-api:
	docker build -t $(USER_NAME)/saurl-api api/.

.PHONY: push-api
push-api:
	docker push $(USER_NAME)/saurl-api

.PHONY: apply-minikube-api
apply-minikube-api:
	kubectl apply -f k8s/minikube/api.yml

.PHONY: delete-minikube-api
delete-minikube-api:
	kubectl delete -f k8s/minikube/api.yml

############
# minikube #
############

.PHONT: minikube-start
minikube-start:
	minikube start

###########
# kubectl #
###########

.PHONY: cluster-info
cluster-info:
	kubectl cluster-info

.PHONY: get-deployments
get-deployments:
	kubectl get deployments

.PHONY: get-pods
get-pods:
	kubectl get pods

.PHONY: get-services
get-services:
	kubectl get services