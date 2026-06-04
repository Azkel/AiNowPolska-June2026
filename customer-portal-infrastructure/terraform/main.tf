terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Demo: use -backend=false locally. Production uses azurerm remote state.
  # backend "azurerm" { ... }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

locals {
  suffix = "portal-${var.environment}"
  tags = merge(var.tags, {
    application = "customer-portal"
    environment = var.environment
    managed_by  = "terraform"
  })
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${local.suffix}"
  location = var.location
  tags     = local.tags
}

# Demo stub — extend with App Service, Key Vault, monitoring modules
resource "azurerm_log_analytics_workspace" "logs" {
  name                = "log-${local.suffix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.logs.id
}
