resource "helm_release" "airflow" {
  name       = "airflow"
  repository = "https://airflow.apache.org"
  chart      = "airflow"
  version    = var.chart_version
  namespace  = var.namespace
  timeout    = 650
  create_namespace = true


  values = [file("${path.module}/helm_values/values.yaml")]

  # set {
  #   name  = "airflow.image.tag"
  #   value = var.airflow_image_tag
  # }
  # set {
  #   name  = "airflow.fernetKey"
  #   value = var.fernet_key
  # }

  # set {
  #   name  = "dags.git.url"
  #   value = var.dags_git_repo_url
  # }

  # set {
  #   name  = "dags.git.ref"
  #   value = var.dags_git_repo_branch
  # }

  # ### POSTGRES ###
  # set {
  #   name  = "postgresql.enabled"
  #   value = false
  # }
  # set {
  #   name  = "postgresql.existingSecret"
  #   value = "airflow-postgres"
  # }
  # set {
  #   name  = "postgresql.postgresqlHost"
  #   value = var.postgres_db_host
  # }
  # set {
  #   name  = "postgresql.postgresqlDatabase"
  #   value = var.postgres_db_name
  # }
  # set {
  #   name  = "postgresql.postgresqlUsername"
  #   value = var.postgres_db_username
  # }
  # ###-----###

  # set {
  #   name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
  #   value = var.irsa_assumable_role_arn
  # }

  # set {
  #   name  = "web.baseUrl"
  #   value = "https://${var.airflow_dns_name}"
  # }

  # set {
  #   name  = "ingress.web.host"
  #   value = var.airflow_dns_name
  # }

  # set {
  #   name  = "ingress.web.annotations.kubernetes\\.io/ingress\\.class"
  #   value = var.ingress_class
  # }

  # set {
  #   name  = "ingress.flower.annotations.kubernetes\\.io/ingress\\.class"
  #   value = var.ingress_class
  # }

  # set {
  #   name  = "airflow.config.AIRFLOW__WEBSERVER__BASE_URL"
  #   value = "https://${var.airflow_dns_name}"
  # }

  # set {
  #   name  = "airflow.config.AIRFLOW__GOOGLE__CLIENT_ID"
  #   value = var.google_oauth_client_id
  # }

  # set {
  #   name  = "airflow.config.AIRFLOW__GOOGLE__CLIENT_SECRET"
  #   value = var.google_oauth_client_secret
  # }

  # set {
  #   name = "worker.keda.enabled"
  #   value = true
  # }

}