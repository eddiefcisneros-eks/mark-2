terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  features {}
}
/*
terraform {
backend "azurerm" {
    use_cli = true
    resource_group_name = "lab-resources-rg"
    storage_account_name = "storagelabaccount"
    container_name = "tfstate"
    key = "prod.terraform.tfstate"
    }
}
*/