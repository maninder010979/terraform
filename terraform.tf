terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

# backend "azurerm" { #maintaining the state in Azure Blob
#     resource_group_name  = var.rg_name
#     storage_account_name = var.blobstorage
#     container_name       = var.blobcontainer
#     key                  = "terraform.tfstate"
#   }

}

terraform {
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  
  features {}
}