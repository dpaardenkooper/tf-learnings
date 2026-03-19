output "vm_name" {
  value = vsphere_virtual_machine.vm.name
}

output "vm_ip" {
  value = var.vm_ip_address
}

output "connect_howto" {
  value = "vCenter Portal -> Virtual Machines -> ${azurerm_linux_virtual_machine.vm.name} -> Connect"
}
