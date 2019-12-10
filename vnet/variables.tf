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
  type = list
  description = "subnet_names"
  }

  variable "subnet_names" {
  type = list
  description = "Virtual Network"
  }

variable "azurerm_resource_group" {
  type = string
  description = "Resource Group"
}

variable "azurerm_virtual_network" {
  type = string
  description = "Resource Group"
}