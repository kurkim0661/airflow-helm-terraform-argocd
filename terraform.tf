# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# terraform {
#   required_providers {
#     kubernetes = {
#       source = "hasicorp/kubernetes"
#       version = "2.11.0"
#     }
#     # aws = {
#     #   source  = "hashicorp/aws"
#     # }
#   }

#   required_version = "~> 1.3"
# }

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "minikube"
    # host                   = "localhost:63210"
    # token                  = data.aws_eks_cluster_auth.this.token
    # cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  }
}