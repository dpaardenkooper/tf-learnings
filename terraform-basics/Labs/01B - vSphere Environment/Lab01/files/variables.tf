variable "vsphere_user" {
  description = "vSphere user account to connect for login purposes"
  type = string
}
 
variable "vsphere_password" {
  description = "vSphere Password of the user account to connect for login purposes"
  type      = string
  sensitive = true
}
 
variable "vsphere_server" {
  description = "Which Server within vCenter to connect for login purposes"
  type = string
}
 
variable "datacenter" {
  description = "Which Datacenter within vCenter to use for the server to be used"
  type = string
}
 
variable "cluster" {
  description = "Which Cluster within vCenter to use for the server to be used"
  type = string
}
 
variable "vm_folder" {
  description = "Foldername in vCenter where the server must be placed"
  type = string
}