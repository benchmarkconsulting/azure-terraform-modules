resource "azurerm_virtual_network" "vpc-network" {
  #count            = var
  name             = var.network_name
  address_space    = [var.address_space]
  resource_group   = var.resource_group 
  location         = var.location
  }
}