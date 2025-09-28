# Resource Group
variable "resource_group_name" {
  type    = string
  default = "TF-RG-alrasheed"
}

# Location, complete the following block:
variable "resource_group_location" {
  type    = string
  default = "East US"
}

#Complete the following block:
# Container Registry name (must be globally unique)
variable "acr_name" {
  type    = string
  default = "acralrasheed12345"
}

# ACR SKU: Basic, Standard, Premium
variable "acr_sku" {
  type    = string
  default = "Basic"
}
