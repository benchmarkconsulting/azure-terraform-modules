resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = var.node_name
    node_count = var.node_count
    vm_size    = var.node_size
    type       = var.node_type
    min_count  = var.min_node_count
    max_count  = var.max_node_count
    max_pods   = var.max_pods
  }

  service_principal {
    client_id     = var.sp_client_id
    client_secret = var.sp_client_secret
  }

  tags = {
    Environment = var.tags
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}