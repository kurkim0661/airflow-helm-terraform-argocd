module "argocd" {
  source = "./modules/k8s/argocd"
}

module "keda" {
  source = "./modules/k8s/keda"
}

module "airflow" {
  source = "./modules/k8s/airflow"
  depends_on = [ module.keda ]
}