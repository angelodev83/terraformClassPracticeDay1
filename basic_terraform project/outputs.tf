#complete the following block outputs according to your workflow:

output "resource_group" {
  value = azurerm_resource_group
}

output "acr_login_server" {
  description = "The login server URL for the ACR"
  value       = azurerm_container_registry
}

output "acr_admin_username" {
  value = azurerm_container_registry
}

output "acr_admin_password" {
  value     = azurerm_container_registry
  sensitive = true
}
