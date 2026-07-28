terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "NitorProjectStateManagement"
    storage_account_name = "stgnitorstatemanagement"
    container_name       = "nitorstatecontainer"
    key                  = "nitorprojectstatefilenew"
  }
}

provider "azurerm" {
  features {

  }
  # Configuration options
}