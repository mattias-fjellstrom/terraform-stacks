resource "github_repository" "demo1" {
  name               = "terraform-stacks-demo-1"
  description        = "Demo repository for Terraform Stacks"
  gitignore_template = "Terraform"
  topics             = ["terraform"]
  visibility         = "private"

  has_wiki        = false
  has_discussions = false
  has_downloads   = false
  has_issues      = false
  has_projects    = false
}

locals {
  demo1_path       = "${path.module}/demo/demo-1"
  demo1_files      = fileset(local.demo1_path, "**/*.{tf,hcl,md,terraform-version}")
  demo1_file_paths = { for f in local.demo1_files : f => "${local.demo1_path}/${f}" }
}

resource "github_repository_file" "all" {
  for_each = local.demo1_file_paths

  repository = github_repository.demo1.name
  file       = each.key
  content    = file(each.value)
}

resource "github_repository_file" "demo1_locals" {
  repository = github_repository.demo1.name
  file       = "locals.tfdeploy.hcl"
  content    = <<-EOF
locals {
  azurerm_client_id       = "${azuread_service_principal.hcp_terraform.client_id}"
  azurerm_subscription_id = "${data.azurerm_subscription.current.subscription_id}"
  azurerm_tenant_id       = "${data.azurerm_subscription.current.tenant_id}"
}
EOF
}
