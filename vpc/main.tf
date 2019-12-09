resource "azure_virtual_network" "vpc-network" {
  name             = var.network_name
  address_space    = var.address_space
  resource_group   = var.resource_group 
  location         = var.location

  subnet {
    name         = var.subnet[count.index]["subnet_name"]
    address_prefix = var.subnet[count.index]["subnet_ip"]
  }
}