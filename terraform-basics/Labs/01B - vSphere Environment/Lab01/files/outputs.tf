output "vm_folder" {
  description = "The name of the created vSphere folder"
  value       = vsphere_folder.vm_folder.path
}
