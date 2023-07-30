module "argocd" {
  source = "./modules/k8s/argocd"
}

module "airflow" {
  source = "./modules/k8s/argocd"
}