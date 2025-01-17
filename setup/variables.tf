variable "aws_region" {
  type        = string
  description = "AWS region for resources"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "github_organization_name" {
  type        = string
  description = "GitHub organization (or private handle) name"
}

variable "github_repository_name" {
  type        = string
  description = "GitHub repository name"
}

variable "hcp_terraform_organization_name" {
  type        = string
  description = "HCP Terraform organization name"
}
