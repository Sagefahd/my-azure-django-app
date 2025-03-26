terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.5"
    }
  }
  required_version = ">= 1.9.0"
}

provider "azurerm" {
    features {}
    skip_provider_registration = true
    
  
}

resource "azurerm_resource_group" "myApp" {
    name = var.resource_group_name
    location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.myApp.name
  location            = azurerm_resource_group.myApp.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_container_app_environment" "myApp" {
    name = var.environment_name
    location = azurerm_resource_group.myApp.location
    resource_group_name = azurerm_resource_group.myApp.name
  
}

resource "azurerm_container_app" "myApp" {
    name = var.app_name
    container_app_environment_id = azurerm_container_app_environment.myApp.id
    resource_group_name = azurerm_resource_group.myApp.name

    revision_mode = "Single"

    template {
      container {
        name = var.container_name
        image = "${azurerm_container_registry.acr.login_server}/${var.app_name}:latest"
        cpu = var.cpu
        memory = var.memory
      }
    }

    ingress {
    external_enabled = var.external_enabled
    target_port      = var.target_port

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}