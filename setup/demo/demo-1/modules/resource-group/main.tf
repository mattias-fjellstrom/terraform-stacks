resource "azurerm_resource_group" "this" {
  name     = "rg-stacks-demo-${var.name_suffix}"
  location = var.location

  tags = {
    ManagedBy = "Terraform"
    Owner     = "Accelerate Tech-Talk"
  }
}
