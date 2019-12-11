# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = var.location
    resource_group_name          = var.azurerm_resource_group
    allocation_method            = "Dynamic"
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
}

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = var.location
    resource_group_name   = var.azurerm_resource_group
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    vm_size               = var.vm_size
    delete_os_disk_on_termination    = true
    delete_data_disks_on_termination = true

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = var.vm_os_publisher
        offer     = var.vm_os_offer
        sku       = var.vm_os_sku
        version   = var.vm_os_version
    }

    os_profile {
        computer_name  = var.name
        admin_username = var.admin_username
        admin_password = var.admin_password
        custom_data    = file("${path.root}/scripts/${var.startup-script}")
    }

    os_profile_linux_config {
        disable_password_authentication = false
        #ssh_keys {
           #path     = "/home/azureuser/.ssh/authorized_keys"
           #key_data = "ssh-rsa AAAAB3Nz{snip}hwhqT9h"
        #}
    }
}