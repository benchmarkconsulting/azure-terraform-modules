variable "prefix" {
  type        = string
  description = "The prefix used for all resources in this example"
}

variable "location" {
  type        = string
  description = "The Azure location where all resources in this example should be created"
}

variable "address_space" {
  type        = string
  description = "Total network address space"
}

variable "azurerm_resource_group" {
  type = string
  description = "Resource Group"
}

variable "azurerm_virtual_network" {
  type = string
  description = "Virtual Network"
}