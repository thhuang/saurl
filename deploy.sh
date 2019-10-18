docker build -t tzuhsuanhuang/saurl-client:latest -t tzuhsuanhuang/saurl-client:$SHA -f ./client/Dockerfile ./client
docker build -t tzuhsuanhuang/saurl-api:latest -t tzuhsuanhuang/saurl-api:$SHA -f ./api/Dockerfile ./api

docker push tzuhsuanhuang/saurl-client:latest
docker push tzuhsuanhuang/saurl-api:latest

docker push tzuhsuanhuang/saurl-client:$SHA
docker push tzuhsuanhuang/saurl-api:$SHA

kubectl apply -f k8s
kubectl set image deployment/client-deployment client=tzuhsuanhuang/saurl-client:$SHA
kubectl set image deployment/api-deployment api=tzuhsuanhuang/saurl-api:$SHA