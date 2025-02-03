output "keyvault" {
  value = {
    id   = azurerm_key_vault.default.id
    name = azurerm_key_vault.default.name
  }
}
