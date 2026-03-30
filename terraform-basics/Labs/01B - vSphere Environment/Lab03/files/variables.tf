variable "vsphere_user" {
  description = "vSphere user account to connect for login purposes"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere Password of the user account to connect for login purposes"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "Which Server within vCenter to connect for login purposes"
  type        = string
}

variable "datacenter_name" {
  description = "Which Datacenter within vCenter to use for the VM"
  type        = string
}

variable "cluster_name" {
  description = "Which Cluster within vCenter to use for the VM"
  type        = string
}

variable "datastore_name" {
  description = "Which Datastore within vCenter to use for the VM"
  type        = string
}

variable "network_name" {
  description = "Network within vCenter to use for the VM"
  type        = string
}

variable "vm_template_name" {
  description = "Which server template to use for the VM"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_domain" {
  description = "Domainname of the VM"
  type        = string
}

variable "vm_folder" {
  description = "Foldername in vCenter where the VM must be placed"
  type        = string
}

variable "vm_num_cpus" {
  description = "Number of vCPUs for the VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory in MB for the VM"
  type        = number
  default     = 4096
}

variable "vm_ipv4_address" {
  description = "IPv4 address of the VM"
  type        = string
}

variable "vm_ipv4_netmask" {
  description = "IPv4 subnetmask of the VM"
  type        = number
}

variable "vm_ipv4_gateway" {
  description = "IPv4 gateway of the VM"
  type        = string
}
