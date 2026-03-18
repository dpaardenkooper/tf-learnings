data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

locals {
  prefix = "${var.name_prefix}${substr(replace(lower(data.azurerm_resource_group.rg.name), "/[^a-z0-9]/", ""), 0, 10)}"
}

module "foundry" {
  source = "./modules/foundry"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = coalesce(var.location, data.azurerm_resource_group.rg.location)

  environment = var.environment
  name_prefix = local.prefix

  deployment_model_name    = var.deployment_model_name
  deployment_model_version = var.deployment_model_version
  deployment_sku_name      = var.deployment_sku_name
  deployment_capacity      = var.deployment_capacity
}
