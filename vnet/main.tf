resource "azurerm_resource_group" "demo" {
  name     = "jdog"
  location = var.location
}

resource "azurerm_virtual_network" "demo1" {
  name                = var.name
  resource_group_name = var.azurerm_resource_group.name
  location            = var.azurerm_resource_group.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  virtual_network_name = var.azurerm_virtual_network.name
  resource_group_name  = var.azurerm_resource_group.name
  address_prefix       = var.address_prefix
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  virtual_network_name = var.azurerm_virtual_network.name
  resource_group_name  = var.azurerm_resource_group.name
  address_prefix       = var.address_prefix
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  virtual_network_name = var.azurerm_virtual_network.name
  resource_group_name  = var.azurerm_resource_group.name
  address_prefix       = var.address_prefix
}