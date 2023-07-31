resource "helm_release" "keda" {
  name             = "keda"
  chart            = "keda"
  repository       = "https://kedacore.github.io/charts"
  namespace        = "keda"
  create_namespace = true
  timeout          = 300
}