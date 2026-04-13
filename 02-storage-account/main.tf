terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Pré-requisito: Resource Group
resource "azurerm_resource_group" "example" {
  name     = "myRG-terraform"
  location = "eastus"
}

# Storage Account (depende do Resource Group acima)
resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccttf2026"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}
