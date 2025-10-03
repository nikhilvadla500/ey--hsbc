# ey--hsbc
TERRAFORM COMMANDS HERE:

terraform init
terraform validate
terraform plan
terraform apply

AFTER CREATED GKE CLUSTER WE CAN FOLLOW BELOW THIS:
I have to enter gcp consloe in gcloud tool :

1. gcloud container clusters list --region us-central1
2.gcloud container clusters get-credentials hdfc-cluster1 --region us-central1
3.kubectl get nodes
4.kubectl create -f hello-deployment.yaml
5.kubectl create -f hello-service.yaml
6.kubectl create -f hello-hpa.yaml
after created...
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl get hpa


