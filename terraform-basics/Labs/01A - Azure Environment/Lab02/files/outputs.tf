output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "storage_account_id" {
  value = azurerm_storage_account.sa.id
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
}

output "container_name" {
  value = azurerm_storage_container.container.name
}
