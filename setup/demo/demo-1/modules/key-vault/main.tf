data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "default" {
  name                       = substr("kv-${var.resource_group.location}-${var.name_suffix}", 0, 24)
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  sku_name                   = "standard"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
