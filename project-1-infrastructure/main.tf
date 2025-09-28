terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider #use azure provider {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing" {
  name =    # your existing RG name
}

# Reference existing Azure Container Registry
data "azurerm_container_registry" "existing" {
  name                =                  # your existing ACR name
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Container Group using the existing image
resource "azurerm_container_group" "webapp" {
  name                = #name of application
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  ip_address_type     = "Public"
  os_type             = "Linux"

  identity {
    type = "SystemAssigned"
  }


image_registry_credential {
  server   = data.azurerm_container_registry.existing.login_server
  username = # use correct varible
  password = # use correct variable
}



  container {
    name   = "webapp"
    image  = "${data.azurerm_container_registry.existing.login_server}/terraformnodejsapp:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 3000
      protocol = "TCP"
    }

        ports {
      port     = 80
      protocol = "TCP"
    }
    
  }
}



