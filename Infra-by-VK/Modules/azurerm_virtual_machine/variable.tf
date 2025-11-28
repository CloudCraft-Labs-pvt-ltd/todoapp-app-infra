variable "network_interfaces" {
  description = "A map of network interface configurations for the virtual machines."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
      public_ip_address_id          = optional(string)
    })
  }))
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

