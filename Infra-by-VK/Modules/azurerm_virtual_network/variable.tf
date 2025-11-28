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
