data "azurerm_subscription" "current" {}

resource "azuread_application" "hcp_terraform" {
  display_name = "hcp-terraform-tech-talk"
}

resource "azuread_service_principal" "hcp_terraform" {
  client_id = azuread_application.hcp_terraform.client_id
}

resource "azurerm_role_assignment" "contributor" {
  scope                = data.azurerm_subscription.current.id
  principal_id         = azuread_service_principal.hcp_terraform.object_id
  role_definition_name = "Contributor"
}

resource "null_resource" "create_flexible_credentials" {
  triggers = {
    time = timestamp()
  }

  provisioner "local-exec" {
    when        = create
    working_dir = "scripts"
    command     = "bash create.sh"
    environment = {
      ORGANIZATION = var.hcp_terraform_organization_name
      PROJECT      = tfe_project.demo.name
      OBJECT_ID    = azuread_application.hcp_terraform.object_id
    }
  }
}
