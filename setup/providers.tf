terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.62.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
}

provider "tfe" {
  organization = var.hcp_terraform_organization_name
}
