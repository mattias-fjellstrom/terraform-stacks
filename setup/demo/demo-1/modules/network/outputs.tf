output "vnet" {
  value = {
    id   = azurerm_virtual_network.default.id
    name = azurerm_virtual_network.default.name
  }
}
