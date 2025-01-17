resource "tfe_project" "demo" {
  name        = "terraform-stacks-demo"
  description = "Project for Terraform Stacks demo"
}

data "tfe_oauth_client" "github" {
  service_provider = "github"
}

resource "tfe_stack" "demo_1" {
  name        = "test-stack"
  description = "Stack for demo 1"
  project_id  = tfe_project.demo.id

  vcs_repo {
    branch     = "main"
    identifier = "${var.github_organization_name}/${var.github_repository_name}"
  }
}
