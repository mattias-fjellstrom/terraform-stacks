identity_token "azurerm" {
  audience = [ "api://AzureADTokenExchange" ]
}

deployment "development" {
  inputs = {
    location       = "swedencentral"
    name_suffix    = "development"
    
    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}

deployment "staging" {
  inputs = {
    location       = "swedencentral"
    name_suffix    = "staging"
    
    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}

deployment "production" {
  inputs = {
    location       = "swedencentral"
    name_suffix    = "production"
    
    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}