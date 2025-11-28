resource "azurerm_virtual_machine" "vm" {
  for_each            = var.network_interfaces

  name                = "${each.key}-vm"
  location            = "East US"
  resource_group_name = "rg-todo"

  network_interface_ids = [
    each.value
  ]

  vm_size = var.vm_size

  storage_os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.os_disk_type
  }

  storage_image_reference {
    publisher = var.os_image.publisher
    offer     = var.os_image.offer
    sku       = var.os_image.sku
    version   = var.os_image.version
  }

  os_profile {
    computer_name  = "${each.key}-vm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }
}