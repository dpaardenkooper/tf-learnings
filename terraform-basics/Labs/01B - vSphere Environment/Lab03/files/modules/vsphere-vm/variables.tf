variable "datacenter_name" {
  description = "Name of the vSphere datacenter"
  type        = string
}

variable "cluster_name" {
  description = "Name of the vSphere compute cluster"
  type        = string
}

variable "datastore_name" {
  description = "Name of the datastore where the VM will be placed"
  type        = string
}

variable "network_name" {
  description = "Name of the port group or network for the VM NIC"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template used for cloning"
  type        = string
}

variable "name" {
  description = "Name of the VM"
  type        = string
}

variable "domain" {
  description = "Domainname of the VM"
  type        = string
}

variable "folder" {
  description = "VM folder path relative to the datacenter VM folder root"
  type        = string
}

variable "create_folder" {
  description = "Whether Terraform should create the VM folder if needed"
  type        = bool
  default     = false
}

variable "num_cpus" {
  description = "Number of vCPUs for the VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB for the VM"
  type        = number
  default     = 4096
}

variable "ipv4_address" {
  description = "IPv4 address of the VM"
  type        = string
}

variable "ipv4_netmask" {
  description = "IPv4 subnetmask of the VM"
  type        = number
}

variable "ipv4_gateway" {
  description = "IPv4 gateway of the VM"
  type        = string
}
