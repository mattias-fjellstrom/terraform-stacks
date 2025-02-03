resource "tfe_project" "demo" {
  name        = "terraform-stacks-demo"
  description = "Project for Terraform Stacks demo"
}

data "tfe_oauth_client" "github" {
  organization     = var.hcp_terraform_organization_name
  service_provider = "github"
  name             = "GitHub organization"
}
