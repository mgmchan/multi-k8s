kubectl create secret generic pgpassword --from-literal MYPASSWORD=Ab123456
secret/pgpassword created

# Following to set up Ingress NGINX on Docker Kubernetes
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml