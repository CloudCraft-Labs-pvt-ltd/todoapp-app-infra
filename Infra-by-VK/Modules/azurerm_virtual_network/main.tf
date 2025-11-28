resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_details
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnets

    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}

output "vnet_id" {
  description = "The ID of the virtual networks."
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}

output "vnet_name" {
  description = "The names of the virtual networks."
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.name }
}

output "vnet_subnets" {
  description = "The subnets of the virtual networks."
  value = {
    for vnet_key, vnet in azurerm_virtual_network.vnet :
    vnet_key => {
      for subnet in vnet.subnet :
      subnet.name => subnet.id
    }
  }
}