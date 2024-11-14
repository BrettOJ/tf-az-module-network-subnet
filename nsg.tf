locals {
  nsg_info = var.create_nsg ?  {
    for key, value in var.subnets :
    "${key}" => {
      nsg_inbound  = lookup(value, "nsg_inbound", [])
      nsg_outbound = lookup(value, "nsg_outbound", [])
    }
  } : {}
}


module "nsg" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-azure-network-nsg?ref=main"
  resource_group_name    = coalesce(var.nsg_resource_group_name, var.resource_group_name)
  location               = var.location
  nsg_info               = local.nsg_info
  diag_object            = var.diag_object
  naming_convention_info = var.naming_convention_info
  dependencies           = [azurerm_subnet.subnet_obj]
  tags                   = var.tags
  netwatcher             = var.netwatcher
}