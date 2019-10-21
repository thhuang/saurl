USER_NAME=tzuhsuanhuang

build: build-client build-api
.PHONY: build

push: push-client push-api
.PHONY: push

apply-k8s: apply-client apply-api apply-ingress # apply-redis
.PHONY: apply-k8s

delete-k8s: delete-client delete-api delete-ingress # delete-redis
.PHONY: delete-k8s

##########
# client #
##########

refresh-client: delete-client build-client push-client apply-client
.PHONY: refresh-client

.PHONY: build-client
build-client:
	docker build --build-arg REACT_APP_API_TOKEN -t $(USER_NAME)/saurl-client:test client/.

.PHONY: run-client
run-client:
	docker build -t $(USER_NAME)/saurl-client:test -f client/Dockerfile.dev client/.
	docker run -it -v /app/node_modules -v $(shell pwd)/client:/app tzuhsuanhuang/saurl-client:test sh

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

refresh-api: delete-api build-api push-api apply-api
.PHONY: refresh-api

.PHONY: build-api
build-api:
	docker build -t $(USER_NAME)/saurl-api:test api/.

.PHONY: run-api
run-api:
	docker build -t $(USER_NAME)/saurl-api:test -f api/Dockerfile.dev api/.
	docker run -it -v $(shell pwd)/api:/app tzuhsuanhuang/saurl-api:test sh

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

# #########
# # redis #
# #########

# .PHONY: apply-redis
# apply-redis:
# 	kubectl apply -f k8s/redis.yml

# .PHONY: delete-redis
# delete-redis:
# 	kubectl delete -f k8s/redis.yml

###########
# ingress #
###########

.PHONY: apply-ingress
apply-ingress:
	kubectl apply -f nginx/ingress-test.yml

.PHONY: delete-ingress
delete-ingress:
	kubectl delete -f nginx/ingress-test.yml

############
# minikube #
############

.PHONT: start
start:
	minikube start

.PHONT: ip
ip:
	minikube ip

.PHONT: dashboard
dashboard:
	minikube dashboard

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

.PHONY: get-ingress
get-ingress:
	kubectl get ingresses.extensions