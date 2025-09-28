#complete the following block outputs according to your workflow:

output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "acr_login_server" {
  description = "The login server URL for the ACR"
  value       = azurerm_container_registry.acrok.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acrok.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acrok.admin_password
  sensitive = true
}
