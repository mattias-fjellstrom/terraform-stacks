component "cluster" {
  source = "./modules/cluster"

  providers = {
    aws    = provider.aws.main
    random = provider.random.main
  }

  inputs = {
    cluster_name       = var.cluster_name
    kubernetes_version = var.kubernetes_version
    region             = var.region
  }
}

component "kube" {
  source = "./modules/kube"

  providers = {
    kubernetes = provider.kubernetes.main
  }
}