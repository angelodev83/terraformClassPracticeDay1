terraform {
  backend "azurerm" {
    resource_group_name   = "lalalala"
    storage_account_name  = "lalalala"   # must match what you created
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
