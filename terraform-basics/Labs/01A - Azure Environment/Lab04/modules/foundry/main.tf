locals {
  env = lower(var.environment)

  foundry_name = substr(replace(lower("${var.name_prefix}${local.env}fdry"), "/[^a-z0-9]/", ""), 0, 24)

  project_name    = "${var.name_prefix}-${local.env}-project"
  deployment_name = "${local.env}-${var.deployment_model_name}"

  tags = {
    environment = local.env
    workload    = "foundry-lab"
  }
}

resource "azurerm_cognitive_account" "foundry" {
  name                = local.foundry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "AIServices"

  sku_name = "S0"

  identity {
    type = "SystemAssigned"
  }

  custom_subdomain_name      = local.foundry_name
  project_management_enabled = true

  tags = local.tags
}

resource "azurerm_cognitive_account_project" "project" {
  name                 = local.project_name
  cognitive_account_id = azurerm_cognitive_account.foundry.id
  location             = var.location

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_cognitive_deployment" "deployment" {
  name                 = local.deployment_name
  cognitive_account_id = azurerm_cognitive_account.foundry.id

  sku {
    name     = var.deployment_sku_name
    capacity = var.deployment_capacity
  }

  model {
    format  = "OpenAI"
    name    = var.deployment_model_name
    version = var.deployment_model_version
  }
}
