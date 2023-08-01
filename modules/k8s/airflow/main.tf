resource "helm_release" "airflow" {
  name       = "airflow"
  repository = "https://airflow.apache.org"
  chart      = "airflow"
  version    = var.chart_version
  namespace  = var.namespace
  timeout    = 650
  create_namespace = true


  values = [file("${path.module}/helm_values/values.yaml")]

}