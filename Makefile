USER_NAME=tzuhsuanhuang

build: build-client build-api
.PHONY: build

push: push-client push-api
.PHONY: push

.PHONY: apply
apply:
	kubectl apply -f k8s

.PHONY: delete
delete:
	kubectl delete -f k8s

##########
# client #
##########

.PHONY: build-client
build-client:
	docker build -t $(USER_NAME)/saurl-client client/.

.PHONY: push-client
push-client:
	docker push $(USER_NAME)/saurl-client

.PHONY: apply-client
apply-client:
	kubectl apply -f k8s/client.yml

.PHONY: delete-client
delete-client:
	kubectl delete -f k8s/client.yml

#######
# api #
#######

.PHONY: build-api
build-api:
	docker build -t $(USER_NAME)/saurl-api api/.

.PHONY: push-api
push-api:
	docker push $(USER_NAME)/saurl-api

.PHONY: apply-api
apply-api:
	kubectl apply -f k8s/api.yml

.PHONY: delete-api
delete-api:
	kubectl delete -f k8s/api.yml

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