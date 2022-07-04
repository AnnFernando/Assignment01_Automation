terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01517411RG"
    storage_account_name = "tfstaten01517411sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}

