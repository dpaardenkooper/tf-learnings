output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "vm_managed_identity_principal_id" {
  value = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}

output "vm_managed_identity_tenant_id" {
  value = azurerm_linux_virtual_machine.vm.identity[0].tenant_id
}

output "bastion_name" {
  value = azurerm_bastion_host.bastion.name
}

output "connect_howto" {
  value = "Azure Portal -> Virtual Machines -> ${azurerm_linux_virtual_machine.vm.name} -> Connect -> Bastion"
}
