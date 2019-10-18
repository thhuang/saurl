USER_NAME=tzuhsuanhuang

build: build-client build-api
.PHONY: build

push: push-client push-api
.PHONY: push

.PHONY: apply
apply:
	kubectl apply -f k8s
	kubectl set image deployment/client-deployment client=tzuhsuanhuang/saurl-client:test
	kubectl set image deployment/api-deployment api=tzuhsuanhuang/saurl-api:test

.PHONY: delete
delete:
	kubectl delete -f k8s

##########
# client #
##########

.PHONY: build-client
build-client:
	docker build -t $(USER_NAME)/saurl-client:test client/.

.PHONY: push-client
push-client:
	docker push $(USER_NAME)/saurl-client:test

.PHONY: apply-client
apply-client:
	kubectl apply -f k8s/client.yml
	kubectl set image deployment/client-deployment client=tzuhsuanhuang/saurl-client:test

.PHONY: delete-client
delete-client:
	kubectl delete -f k8s/client.yml

#######
# api #
#######

.PHONY: build-api
build-api:
	docker build -t $(USER_NAME)/saurl-api:test api/.

.PHONY: push-api
push-api:
	docker push $(USER_NAME)/saurl-api:test

.PHONY: apply-api
apply-api:
	kubectl apply -f k8s/api.yml
	kubectl set image deployment/api-deployment api=tzuhsuanhuang/saurl-api:test

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