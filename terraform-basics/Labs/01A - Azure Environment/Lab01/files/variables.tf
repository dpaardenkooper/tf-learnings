variable "resource_group_name" {
  type        = string
  description = "Existing resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names."
  default     = "lab01"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID."
}
