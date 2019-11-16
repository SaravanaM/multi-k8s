docker build -t khkz211/multi-client:latest -t khkz211/multi-client:$SHA ./client/Dockerfile ./client
docker build -t khkz211/multi-server:latest -t khkz211/multi-server:$SHA ./server/Dockerfile ./server
docker build -t khkz211/multi-worker:latest -t khkz211/multi-worker:$SHA ./worker/Dockerfile ./worker

docker push khkz211/multi-client:latest
docker push khkz211/multi-server:latest
docker push khkz211/multi-worker:latest

docker push khkz211/multi-client:latest
docker push khkz211/multi-server:latest
docker push khkz211/multi-worker:latest

kubectl apply -f k8s
docker set image deployment/server-deployment server=khkz211/multi-server:$SHA
docker set image deployment/client-deployment client=khkz211/multi-client:$SHA
docker set image deployment/worker-deployment worker=khkz211/multi-worker:$SHA