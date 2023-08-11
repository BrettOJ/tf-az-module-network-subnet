locals {
  tags = {
    "created-by" = "Terraform"
 
  }

  naming_convention_info = {
    name         = "eg"
    project_code = "boj"
    env          = "dev"
    zone         = "z1"
    agency_code  = "brettoj"
    tier         = "web"
  }
}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {

      }
    }
  }
}

module "azure_virtual_network"  {
  source = "git::https://github.com/BrettOJ/tf-az-module-virtual-network?ref=main"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = module.resource_groups.rg_output[1].name
  naming_convention_info = local.naming_convention_info
}

module "azure_subnet" {
  source = "../"
  resource_group_name  = module.resource_groups.rg_output[1].name
  virtual_network_name = module.azure_virtual_network.vnets_output.name
  location               = var.location
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
  subnets = {
  001 = {
      name              = var.subnet_name
      address_prefixes  = ["10.0.1.0/24"]
      service_endpoints = null
      private_endpoint_network_policies_enabled = null
      route_table_id    = null
      delegation  = null
    }
  }
}