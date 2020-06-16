output "aks_cluster_name" {
    value = azurerm_kubernetes_cluster.aks.name
    description = "The name of the AKS cluster being created"
}
output "aks_location" {
    value = azurerm_resource_group.aks.location
    description = "The region where the AKS will be created"
}
output "aks_rg_name" {
    value = azurerm_resource_group.aks.name
    description = "The name of the AKS resource group being created"
}