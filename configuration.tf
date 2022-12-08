
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.30.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.15.0"
    }
  }
}

provider azurerm {
  features {}
}

data azurerm_client_config current {}