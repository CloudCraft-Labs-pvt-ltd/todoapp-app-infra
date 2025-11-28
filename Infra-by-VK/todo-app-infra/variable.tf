variable "resource_groups" {
  type = map(object({
    location = string
    resource_group_name = string
    tags     = map(string)
  }))
}

variable "vnet_details" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
} 

variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "network_interfaces" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    private_ip_allocation = string
  }))
}

variable "subnet_map" {
  description = "Map of subnet_name => subnet_id"
  type        = map(string)
}

variable "vm_size" {
  description = "The size of the virtual machines."
  type        = string
  default     = "Standard_DS1_v2"
}
variable "admin_username" {
  description = "The admin username for the virtual machines."
  type        = string
  default     = "azureuser"
}
variable "admin_password" {
  description = "The admin password for the virtual machines."
  type        = string
  default     = "P@ssw0rd1234!"
}
variable "os_image" {
  description = "The OS image details for the virtual machines."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
variable "os_disk_type" {
  description = "The managed disk type for the OS disk."
  type        = string
  default     = "Standard_LRS"
}
variable "disable_password_authentication" {
  description = "Whether to disable password authentication for Linux VMs."
  type        = bool
  default     = false
}

variable "subnet_map" {
  type = map(string)
  description = "Map of subnet_name => subnet_id"
}