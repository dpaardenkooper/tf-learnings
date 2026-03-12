variable "resource_group_name" {
  type        = string
  description = "Existing resource group assigned to the trainee."
}

variable "location" {
  type        = string
  description = "Azure region (should match the RG location)."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names."
  default     = "lab01"
}

variable "admin_username" {
  type        = string
  description = "VM admin username."
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key to place on the VM."
  default     = ".ssh/key.pub"
}
