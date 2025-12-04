terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-todo"
  #   storage_account_name = "storageacc2359"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "22135fc2-ce1f-463b-9d7e-0de70cc656ec"
}


#added PR aproval-1

#main branch is lock

#new commit