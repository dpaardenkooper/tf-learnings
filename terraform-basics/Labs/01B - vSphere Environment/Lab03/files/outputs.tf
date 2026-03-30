output "vm_name" {
  description = "Name of the created virtual machine."
  value       = module.training_vm.vm_name
}

output "vm_id" {
  description = "Managed object ID of the created virtual machine."
  value       = module.training_vm.vm_id
}

output "vm_ip" {
  description = "Default IP address reported by VMware Tools."
  value       = module.training_vm.vm_ip
}

output "vm_ips" {
  description = "All guest IP addresses reported by VMware Tools."
  value       = module.training_vm.vm_ips
}

output "vm_folder" {
  description = "Folder path where the VM was placed."
  value       = module.training_vm.vm_folder
}
