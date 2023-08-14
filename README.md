[![Build status](https://dev.azure.com/ggavanade/Merlion/_apis/build/status/modules/diagnostics)](https://dev.azure.com/ggavanade/Merlion/_build/latest?definitionId=<build_id>)
# Deploys tf-module-az-network-subnet for an Azure resource
Deploys the tf-module-az-network-subnet for an already existing Azure resource


Reference the module to a specific version (recommended):
```hcl
<code_block>
```

# Parameters
## <paraml1>

# Roles
Roles required by the module canbe found in [rbac-roles](./rbac-roles) folder

# Outputs
| Name | Type | Description | 
| -- | -- | -- | 
| obj | object | Returns the created tf-module-az-network-subnet 

## Terraform Documentation

Manages a virtual network including any configured subnets. Each subnet can optionally be configured with a security group to be associated with the subnet.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#example-usage)

```
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#name) - (Required) The name of the virtual network. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#resource_group_name) - (Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created.
    
-   [`address_space`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#address_space) - (Required) The address space that is used the virtual network. You can supply more than one address space.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#location) - (Required) The location/region where the virtual network is created. Changing this forces a new resource to be created.
    

___

-   [`bgp_community`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#bgp_community) - (Optional) The BGP community attribute in format `<as-number>:<community-value>`.

-   [`ddos_protection_plan`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#ddos_protection_plan) - (Optional) A `ddos_protection_plan` block as documented below.
    
-   [`encryption`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#encryption) - (Optional) A `encryption` block as defined below.
    
-   [`dns_servers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#dns_servers) - (Optional) List of IP addresses of DNS servers
    

-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#edge_zone) - (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    
-   [`flow_timeout_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#flow_timeout_in_minutes) - (Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between `4` and `30` minutes.
    
-   [`subnet`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#subnet) - (Optional) Can be specified multiple times to define multiple subnets. Each `subnet` block supports fields documented below.
    

-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#tags) - (Optional) A mapping of tags to assign to the resource.

___

A `ddos_protection_plan` block supports the following:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#id) - (Required) The ID of DDoS Protection Plan.
    
-   [`enable`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#enable) - (Required) Enable/disable DDoS Protection Plan on Virtual Network.
    

___

A `encryption` block supports the following:

-   [`enforcement`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#enforcement) - (Required) Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are `DropUnencrypted` and `AllowUnencrypted`.

___

The `subnet` block supports:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#name) - (Required) The name of the subnet.
    
-   [`address_prefix`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#address_prefix) - (Required) The address prefix to use for the subnet.
    
-   [`security_group`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#security_group) - (Optional) The Network Security Group to associate with the subnet. (Referenced by `id`, ie. `azurerm_network_security_group.example.id`)
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#id) - The virtual NetworkConfiguration ID.
    
-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#name) - (Required) The name of the virtual network. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#resource_group_name) - (Required) The name of the resource group in which to create the virtual network.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#location) - (Required) The location/region where the virtual network is created. Changing this forces a new resource to be created.
    
-   [`address_space`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#address_space) - (Required) The list of address spaces used by the virtual network.
    
-   [`guid`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#guid) - The GUID of the virtual network.
    
-   [`subnet`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#subnet) - (Optional) One or more `subnet` blocks as defined below.
    

___

The `subnet` block exports:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#id) - The ID of this subnet.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#create) - (Defaults to 30 minutes) Used when creating the Virtual Network.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#update) - (Defaults to 30 minutes) Used when updating the Virtual Network.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#read) - (Defaults to 5 minutes) Used when retrieving the Virtual Network.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#delete) - (Defaults to 30 minutes) Used when deleting the Virtual Network.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#import)

Virtual Networks can be imported using the `resource id`, e.g.

```
terraform import azurerm_virtual_network.exampleNetwork /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1
```