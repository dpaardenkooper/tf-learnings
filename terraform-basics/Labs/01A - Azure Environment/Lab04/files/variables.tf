variable "resource_group_name" {
  type        = string
  description = "Existing resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
  default     = null
}

variable "environment" {
  type        = string
  description = "Environment name, for example dev, test, prod."
}

variable "name_prefix" {
  type        = string
  description = "Short prefix for naming."
  default     = "lab"
}

variable "deployment_model_name" {
  type        = string
  description = "OpenAI model name to deploy."
  default     = "gpt-4o"
}

variable "deployment_model_version" {
  type        = string
  description = "OpenAI model version to deploy."
  default     = "2024-11-20"
}

variable "deployment_sku_name" {
  type        = string
  description = "Deployment SKU."
  default     = "GlobalStandard"
}

variable "deployment_capacity" {
  type        = number
  description = "Deployment capacity."
  default     = 1
}
