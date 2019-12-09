variable "resource_group" {
  description = "The resource group where this VPC will be created"
}

variable "create_network" {
  type        = bool
  default     = true
  description = "Specify whether to create a new network or just assume it already exists."
}

variable "network_name" {
    description = "The name of the VPC being created."
    type        = string
}    

variable "auto_create_subnetworks" {
    description = "If set to true, this network will be created in auto subnet mode, and Google will create a subnet for each region automatically. If set to false, a custom subnetted network will be created that can support google_compute_subnetwork resources."
    type        = string
    default     = "true"
}
variable "shared_vpc_host" {
  type        = string
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  default     = "false"
}

variable "routing_mode" {
    description = "Sets the network-wide routing mode for Cloud Routers to use. Accepted values are GLOBAL or REGIONAL."
    type        = string
    default     = "GLOBAL"
}           

variable "subnet" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "address_space" {
  type        = list(map(string))
  description = "The networks address range in CIDR"
}
           
variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "location" {
  type        = string
  description = "where do we want to set up the VPC."
  default     = ""
}

variable "routes" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}