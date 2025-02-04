identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "swedencentral" {
  inputs = {
    location    = "swedencentral"
    name_suffix = "techtalk"

    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}

deployment "westeurope" {
  inputs = {
    location    = "westeurope"

    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}

deployment "northeurope" {
  inputs = {
    location    = "northeurope"

    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}

deployment "eastus" {
  inputs = {
    location    = "eastus"

    identity_token  = identity_token.azurerm.jwt
    client_id       = local.azurerm_client_id
    subscription_id = local.azurerm_subscription_id
    tenant_id       = local.azurerm_tenant_id
  }
}