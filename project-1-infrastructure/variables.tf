# This file defines the settings you can change

variable "resource_group_name" {
  description = "application_1_rg"
  type        = string
  default     = ""
}

variable #name the variable {
  description = "Azure region"
  type        = string
  default     = "East US"
}

# add acr credentials as variables if priviledges are not available

variable #name the variable {
  description = "ACR admin username"
  type        = string
}

variable "acr_password" {
  description = "ACR admin password"
  type        = #put the type, tring or boolean?
  sensitive   = true
}
