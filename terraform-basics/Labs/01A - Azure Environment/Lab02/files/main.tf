data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

locals {
  prefix = "${var.name_prefix}${substr(replace(lower(data.azurerm_resource_group.rg.name), "/[^a-z0-9]/", ""), 0, 10)}"
}

resource "azurerm_storage_account" "sa" {
  name                     = "sa${local.prefix}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = coalesce(var.location, data.azurerm_resource_group.rg.location)
  account_tier             = "Standard"
  account_replication_type = "LRS"

  account_kind = "StorageV2"

  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "container" {
  name                  = "blob${local.prefix}"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}
