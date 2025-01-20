resource "random_string" "this" {
  lower   = true
  upper   = false
  numeric = true
  special = false
  length  = 5
}

resource "azurerm_storage_account" "this" {
  name                = "st${random_string.this.result}${var.name_suffix}"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    ManagedBy = "Terraform"
    Owner     = "Accelerate Tech-Talk"
  }
}
