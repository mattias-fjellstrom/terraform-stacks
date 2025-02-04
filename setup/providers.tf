terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.5.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.62.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
}

provider "github" {
  owner = var.github_organization_name
}

provider "tfe" {
  organization = var.hcp_terraform_organization_name
}
