variable "vnet_name" {
  description = "Name of the vnet to create"
}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
}
