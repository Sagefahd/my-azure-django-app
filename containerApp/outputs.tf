# outputs.tf

output "resource_group_name" {
  description = "Name of the created Azure Resource Group"
  value       = azurerm_resource_group.myApp.name
}

output "resource_group_location" {
  description = "Location of the created Azure Resource Group"
  value       = azurerm_resource_group.myApp.location
}

output "container_registry_name" {
  description = "Name of the Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "container_registry_login_server" {
  description = "Login server URL for the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "container_app_environment_name" {
  description = "Name of the Container App Environment"
  value       = azurerm_container_app_environment.myApp.name
}

output "container_app_name" {
  description = "Name of the Container App"
  value       = azurerm_container_app.myApp.name
}

output "container_app_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the Container App"
  value       = azurerm_container_app.myApp.ingress[0].fqdn
}

output "container_app_url" {
  description = "Public URL of the Container App"
  value       = "https://${azurerm_container_app.myApp.ingress[0].fqdn}"
}