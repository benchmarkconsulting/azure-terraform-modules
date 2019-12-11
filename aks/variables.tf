variable "dns_prefix" {
  type = string
  description = "dns prefix"
}

variable "cluster_name" {
  type = string
  description = "Name of your cluster"
}

variable "resource_group_name" {
  type = string
  description = "Resource group to add AKS cluter to"
}

variable "location" {
  type = string
  description = "what region shoudl we add the cluster to"
}

variable "node_size" {
  type = string
  description = "specify the image type"
}

variable "node_count" {
  type = string
  description = "specify the number of nodes"
}

variable "node_name" {
  type = string
  description = "specify the node names"
}

variable "tags" {
  type = string
  description = "what tags"
}

variable "autoscale" {
  type = bool
  description = "would oyu like to autoscale"
}

variable "sp_client_id" {
  description = "The Client ID of the Service Principal assigned to Kubernetes"
}

variable "sp_client_secret" {
  description = "The Client Secret of the Service Principal assigned to Kubernetes"
}