

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "eastus"
    resource_group_name          = var.azurerm_resource_group
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
    name                      = "myNIC"
    location                  = var.location
    resource_group_name       = var.azurerm_resource_group
    network_security_group_id = var.azurerm_network_security_group

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = var.azurerm_subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }

    tags = {
        environment = "Terraform Demo"
    }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = var.azurerm_resource_group
    }
    
    byte_length = 8
}

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = var.location
    resource_group_name   = var.azurerm_resource_group
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    vm_size               = "Standard_DS1_v2"
    delete_os_disk_on_termination    = true
    delete_data_disks_on_termination = true

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
        admin_password = "Pa$$1234"
    }

    os_profile_linux_config {
        disable_password_authentication = false
        #ssh_keys {
           #path     = "/home/azureuser/.ssh/authorized_keys"
           #key_data = "ssh-rsa AAAAB3Nz{snip}hwhqT9h"
        #}
    }

    tags = {
        environment = "Terraform Demo"
    }
}