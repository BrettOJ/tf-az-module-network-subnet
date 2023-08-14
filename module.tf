resource "azurerm_subnet" "subnet_obj" {
  for_each = var.subnets

  name                                           = coalesce(lookup(each.value, "name", null), module.subnet_name.naming_convention_output[each.key].names.0)
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = lookup(each.value, "address_prefixes", [])
  service_endpoints                              = lookup(each.value, "service_endpoints", [])
  private_endpoint_network_policies_enabled      = lookup(each.value, "private_endpoint_network_policies_enabled", null)
  private_link_service_network_policies_enabled  = lookup(each.value, "private_link_service_network_policies_enabled", null)
  depends_on                                     = [var.dependencies]

  dynamic "delegation" {
    for_each = each.value.delegation != null ? [1] : []

    content {
      name = lookup(each.value.delegation, "delegationname", null)
      
      service_delegation {
        name    = lookup(each.value.delegation, "name", null)
        actions = lookup(each.value.delegation, "actions", null)
      }
    }
  }
}

