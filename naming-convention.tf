module "subnet_name" {
  source        = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  resource_type = "snet"
  name_format   = "res_type|-|site|-|env|-|app|-|name"
  naming_convention_info = {
    for key, value in var.subnets :
    "${key}" => {
      name_info = merge(var.naming_convention_info, { name = key })
      tags      = var.tags
    }
  }
}
