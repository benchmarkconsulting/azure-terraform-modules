output "network_loc" {
    value = azurerm_resource_group.network.location
    description = "The region where the network will be created"
}
output "name" {
    value = azurerm_virtual_network.vnet.name
    description = "The name of the VPC network being created"
}