terraform {
    required_version = ">= 1.3.0"
    
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "rg-terraform-state"
    storage_account_name = "joaoterraformstate96"
    container_name = "remote-state"
    key = "azure-vm/terraform.tfstate"
  }
  
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "foo" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "joaoterraformstate96"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}


