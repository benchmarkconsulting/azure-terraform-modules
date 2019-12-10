resource "azurerm_resource_group" "demo" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "demo1" {
  name                = "${var.prefix}-network"
  resource_group_name = var.azurerm_resource_group.name
  location            = var.azurerm_resource_group.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  virtual_network_name = var.azurerm_virtual_network.name
  resource_group_name  = var.azurerm_resource_group.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  virtual_network_name = var.azurerm_virtual_network.name
  resource_group_name  = var.azurerm_resource_group.name
  address_prefix       = "10.0.2.0/24"
}