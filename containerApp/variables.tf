variable "resource_group_name" {
    description = "Name of azure resource group"
    type = string
}

variable "location" {
    description = "azure region for resource"
    type = string
    default = "West US"
}


variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "environment_name" {
    description = "name of container app environment"
    type = string
}

variable "app_name" {
    description = "name of container app"
    type = string
}

variable "container_name" {
    description = "name of container"
    type = string
}

variable "cpu" {
    description = "cpu allocated for the container"
    type = string
    default = "0.25"
}

variable "memory" {
    description = "memory allocation for the container"
    type = string
    default = "0.5Gi"
}

variable "external_enabled" {
    description = "whether the app is accessible externally"
    type = bool
    default = true
}

variable "target_port" {
    description = "the port the container listens on"
    type = number
    default = 80
  
}

