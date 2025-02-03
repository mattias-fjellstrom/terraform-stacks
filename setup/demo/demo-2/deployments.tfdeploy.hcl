identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    cluster_name       = "stacks-demo"
    kubernetes_version = "1.30"
    region             = "eu-west-1"
    role_arn           = local.role_arn
    identity_token     = identity_token.aws.jwt
    default_tags = {
      stacks-preview-example = "eks-deferred-stack"
    }
  }
}