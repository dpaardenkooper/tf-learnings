output "foundry_account_name" {
  value = azurerm_cognitive_account.foundry.name
}

output "foundry_project_name" {
  value = azurerm_cognitive_account_project.project.name
}

output "foundry_endpoint" {
  value = azurerm_cognitive_account.foundry.endpoint
}

output "deployment_name" {
  value = azurerm_cognitive_deployment.deployment.name
}
