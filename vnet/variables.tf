variable "location" {
  type        = string
  description = "The Azure location where all resources in this example should be created"
}

variable "address_space" {
  type        = string
  description = "Total network address space"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group"
}

variable "subnet_prefixes" {
  type = string
  description = "Virtual Network"
  }

  variable "subnet_names" {
  type = string
  description = "Virtual Network"
  }