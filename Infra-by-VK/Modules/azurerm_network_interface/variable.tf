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