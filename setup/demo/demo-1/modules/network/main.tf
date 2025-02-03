resource "azurerm_virtual_network" "default" {
  name                = "vnet-${var.resource_group.location}-${var.name_suffix}"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  address_space = [
    var.virtual_network_address,
  ]
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.default.name

  address_prefixes = [
    cidrsubnet(var.virtual_network_address, 8, 0)
  ]
}

resource "azurerm_subnet" "db" {
  name                 = "snet-db"
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.default.name

  address_prefixes = [
    cidrsubnet(var.virtual_network_address, 8, 1)
  ]
}
