data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

locals {
  location = coalesce(var.location, data.azurerm_resource_group.rg.location)
  prefix   = "${var.name_prefix}-${substr(replace(lower(data.azurerm_resource_group.rg.name), "/[^a-z0-9]/", ""), 0, 10)}"
}

resource "azurerm_key_vault" "kv" {
  name                = "kv${local.prefix}"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id

  sku_name = "standard"

  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  public_network_access_enabled = true
}
