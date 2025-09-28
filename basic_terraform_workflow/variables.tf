# Resource Group
variable "#put variable" {
  type    = string
  default = #name of resource
}

# Location, complete the following block:
variable "location" {
  type    = string
  default = 
}

#Complete the following block:
# Container Registry name (must be globally unique)
variable "acr_name" {
  type    = string
  default = 
}

# ACR SKU: Basic, Standard, Premium
variable "acr_sku" {
  type    = string
  default = "Basic"
}
