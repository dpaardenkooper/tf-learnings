output "vm_name" {
  description = "Name of the created virtual machine."
  value       = vsphere_virtual_machine.this.name
}

output "vm_id" {
  description = "Managed object ID of the created virtual machine."
  value       = vsphere_virtual_machine.this.id
}

output "vm_ip" {
  description = "Default IP address reported by VMware Tools."
  value       = vsphere_virtual_machine.this.default_ip_address
}

output "vm_ips" {
  description = "All guest IP addresses reported by VMware Tools."
  value       = vsphere_virtual_machine.this.guest_ip_addresses
}

output "vm_folder" {
  description = "Folder path where the VM was placed."
  value       = local.effective_folder
}
