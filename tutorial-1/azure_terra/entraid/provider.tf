terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
     random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
   features {}
   subscription_id = "713f31df-8e37-41ae-a27f-fdb623e1e820"
}