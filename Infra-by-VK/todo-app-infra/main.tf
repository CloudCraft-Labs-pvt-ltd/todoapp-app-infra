module "resource_groups" {
  source          = "../Modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "vnet" {
  source       = "../Modules/azurerm_virtual_network"
  vnet_details = var.vnet_details
  depends_on   = [module.resource_groups]
}

module "storage_account" {
  source           = "../Modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
  depends_on       = [module.resource_groups]
}

module "stg-container-module" {
  depends_on            = [module.storage_account]
  source                = "../modules/storage_account_container"
  container_name        = "tfstate"
  storage_account_id    = module.storage_account.storage_account_id["sa1"]
  container_access_type = "private"
}

module "nic" {
  source             = "../Modules/azurerm_network_interface"
  network_interfaces = var.network_interfaces
  subnet_map         = module.vnet.vnet_subnets["vnet1"]
  depends_on         = [module.vnet]
}

module "vm" {
  source              = "../Modules/azurerm_virtual_machine"
  network_interfaces  = module.nic.nic_ids
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  os_image            = var.os_image
  os_disk_type        = var.os_disk_type
  disable_password_authentication = var.disable_password_authentication
  depends_on          = [module.nic]
} 