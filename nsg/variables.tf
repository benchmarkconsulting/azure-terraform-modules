variable "name_prefix" {
  type = string
  description = "Machine prefix"
}

variable "amount" {
  type        = string
  description = "the amount of comute nodes to create"
  default     = 1
}

variable "machine_type" { 
    type = string
    description = "machine size"
    default = "n1-standard-1"
}

variable "zone" {
  type = string
  description = "Zone ot deploy the machine in"
  default = "us-east1-b"
}

variable "image" {
    type = string
    description = "OS image to use for compute instance"
    default = "ubuntu-1904-disco-v20191019"
}

variable "subnetwork" {
    type = string
    description = "the network to host host compute instances"
    default = "default"
}

variable "tags" {
    type = string
    description = "the network to host host compute instances"
    default = "default"
}

variable "startup-script" {
  type = string
  description = "Name of the startup Script"
  default = ""
}
