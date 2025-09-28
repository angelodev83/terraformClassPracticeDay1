
# Provider
provider "azurerm" {
  features {}
}

# Complete the following block:
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# complete the following block:
resource "azurerm_container_registry" "acrok" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = true
}
