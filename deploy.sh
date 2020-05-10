docker build -t mgmchan1216/multi-k8s-client:latest -t mgmchan1216/multi-k8s-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t mgmchan1216/multi-k8s-server:latest -t mgmchan1216/multi-k8s-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t mgmchan1216/multi-k8s-worker:latest -t mgmchan1216/multi-k8s-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push mgmchan1216/multi-k8s-client:latest
docker push mgmchan1216/multi-k8s-client:$GIT_SHA

docker push mgmchan1216/multi-k8s-server:latest
docker push mgmchan1216/multi-k8s-server:$GIT_SHA

docker push mgmchan1216/multi-k8s-worker:latest
docker push mgmchan1216/multi-k8s-worker:$GIT_SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=mgmchan1216/multi-k8s-server:$GIT_SHA
kubectl set image deployments/client-deployment client=mgmchan1216/multi-k8s-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=mgmchan1216/multi-k8s-worker:$GIT_SHA