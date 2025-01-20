resource "tfe_project" "demo" {
  name        = "terraform-stacks-demo"
  description = "Project for Terraform Stacks demo"
}

data "tfe_oauth_client" "github" {
  organization     = var.hcp_terraform_organization_name
  service_provider = "github"
  name             = "GitHub organization"
}

resource "tfe_stack" "demo1" {
  name       = "stack-demo-1"
  project_id = tfe_project.demo.id

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/${github_repository.demo1.name}"
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }
}
