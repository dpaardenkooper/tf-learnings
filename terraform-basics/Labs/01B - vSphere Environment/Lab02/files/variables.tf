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
 
variable "datastore" {
  description = "Which Datastore within vCenter to use for the server to be used"
  type = string
}
 
variable "network" {
  description = "Network within vCenter to use for the server to be used"
  type = string
}
 
variable "template_name" {
  description = "Which server template to use for the server"
  type = string
}
 
variable "vm_folder" {
  description = "Foldername in vCenter where the server must be placed"
  type = string
}
 
variable "vm_name" {
  description = "Name of the server"
  type = string
}

variable "vm_domain" {
  description = "Domainname of the server"
  type = string
}

variable "vm_ip_address" {
  description = "IP address of the server"
  type = string
}

variable "vm_ip_netmask" {
  description = "IP subnetmask of the server"
  type = integer
}

variable "vm_ip_gateway" {
  description = "IP gateway of the server"
  type = string
}