resource "azurerm_resource_group" "nsg" {
  name     = module.network.resource_group_name
  location = module.network.location
}

resource "azurerm_virtual_machine" "vm-linux" {
  #count                         = "${!contains(list("${var.vm_os_simple}","${var.vm_os_offer}"), "Windows") && var.is_windows_image != "true" && var.data_disk == "false" ? var.nb_instances : 0}"
  name                          = "${var.vm_hostname}${count.index}"
  location                      = var.location
  resource_group_name           = var.azurerm_resource_group.vm.name
  availability_set_id           = azurerm_availability_set.vm.id
  vm_size                       = var.vm_size
  network_interface_ids         = ["${element(azurerm_network_interface.vm.*.id, count.index)}"]
  delete_os_disk_on_termination = var.delete_os_disk_on_termination

  storage_image_reference {
    id        = var.vm_os_id
    publisher = var.vm_os_id == "" ? coalesce(var.vm_os_publisher, module.os.calculated_value_os_publisher) : ""
    offer     = var.vm_os_id == "" ? coalesce(var.vm_os_offer, module.os.calculated_value_os_offer) : ""
    sku       = var.vm_os_id == "" ? coalesce(var.vm_os_sku, module.os.calculated_value_os_sku) : ""
    version   = var.vm_os_id == "" ? var.vm_os_version : ""
  }

  storage_os_disk {
    name              = "osdisk-${var.vm_hostname}-${count.index}"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.storage_account_type
  }

  os_profile {
    computer_name  = "${var.vm_hostname}${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
    custom_data    = var.custom_data
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = file("${var.ssh_key}")
    }
  }
}