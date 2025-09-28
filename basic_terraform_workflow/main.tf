
# Provider
provider "azurerm" {
  features {}
}

# Complete the following block:
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.
}

# complete the following block:
resource "azurerm_container_registry" "acrok" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group
  location            = azurerm_resource_group
  sku                 = var.acr_sku
  admin_enabled       = true
}
