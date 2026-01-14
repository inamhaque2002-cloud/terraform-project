terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"  // Updated to latest major version compatible as of 2026 (4.57.0 available)
    }
  }

  backend "azurerm" {
    resource_group_name  = "inam-tfsatate-rg"
    storage_account_name = "inamstorage1234"  // Use your unique name
    container_name       = "inamcontainer1234"
    key                  = "jenkins-demo.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "InamJenkinsTerraformRG5"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "InamJenkinsVNet5"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
