[![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets/actions/workflows/dependency-tests.yml) [![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)

# Module: Dynamic Subnets

## Description

Create dynamic subnets based on a subnet input config/variable input, on an existing or new Azure Virtual Network using Terraform.  
This module can be used to do the following subnet tasks based on input:  

- Create a new resource group and Vnet and populate with subnets based on input variable subnet config.
- Create a new Vnet in an existing resource group and populate with subnets based on input variable subnet config.
- Populate subnets dynamically onto an existing Vnet in an existing resource group based on input variable subnet config.

## Example 1

Simple example where a new Resource Group and Vnet will be created (Default).  
This example requires no input and will create a new resource group and vnet populated with demo subnets based on the default input variables.  

```hcl
provider "azurerm" {
    features {}
}

module "dynamic-subnets" {
    source  = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
}
```

## Example 2

Simple example where a new Vnet with custom DNS will be created in an existing resource group.  
This example requires an existing resource group and will create a new vnet populated with demo subnets based on the default input variables.  

```hcl
provider "azurerm" {
    features {}
}

module "dynamic-subnets" {
    source                  = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"

    create_rg               = false     #Existing VNET Resource group name must be provided.
    virtual_network_rg_name = "Core-Networking-Rg"
    dns_entries             = ["10.1.0.10", "10.1.0.138"]
}
```

## Example 3

Simple example where subnets are populated dynamically onto an existing Vnet.  
This example requires an existing resource group and VNET that will be populated with demo subnets based on the default input variables.  
This example assumes a network address space of "10.1.0.0/22" with no subnets exists.  
For more advanced examples see: [examples](https://github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets/tree/master/examples)  

```hcl
provider "azurerm" {
    features {}
}

module "dynamic-subnets" {
    source                  = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"

    create_rg               = false     #Existing VNET Resource group name must be provided.
    create_vnet             = false     #Existing VNET name must be provided.
    virtual_network_rg_name = "My-ResourceGroup-Name"
    virtual_network_name    = "My-VNET-Name"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.83.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.83.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.core_network_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.dynamic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.core_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.core_network_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.core_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of key value pairs that is used to tag resources created. (Default: demo map) | `map(string)` | <pre>{<br>  "Description": "This is a demo built with Terraform",<br>  "Terraform": "True"<br>}</pre> | no |
| <a name="input_create_rg"></a> [create\_rg](#input\_create\_rg) | Create a new resource group for this deployment. (Set to false to use existing resource group) | `bool` | `true` | no |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Create a new Azure Virtual Network for this deployment. (Set to false to use existing Azure Virtual Network) | `bool` | `true` | no |
| <a name="input_dns_entries"></a> [dns\_entries](#input\_dns\_entries) | Set custom dns config. If no values specified, this defaults to Azure DNS (Only in effect on newly created Vnet when variable:create\_vnet=true) | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Value to describe the environment. Used for tagging. (Default: Development) | `string` | `"Development"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location in azure where resources will be created. (Only in effect on newly created Resource Group when variable:create\_rg=true) | `string` | `"uksouth"` | no |
| <a name="input_network_address_ip"></a> [network\_address\_ip](#input\_network\_address\_ip) | Network IP to construct network address space. (Only in effect on newly created Vnet when variable:create\_vnet=true) | `string` | `"10.1.0.0"` | no |
| <a name="input_network_address_mask"></a> [network\_address\_mask](#input\_network\_address\_mask) | Network address mask to construct network address space. (Only in effect on newly created Vnet when variable:create\_vnet=true) | `number` | `22` | no |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | Subnet config map for each subnet to be created in either existing or newly created VNET based on. (create\_vnet=true/false) | <pre>map(object({<br>    name      = string<br>    mask      = number<br>    cidr_base = string<br>  }))</pre> | <pre>{<br>  "Dev": {<br>    "cidr_base": "10.1.2.0",<br>    "mask": 24,<br>    "name": "Dev"<br>  },<br>  "Dmz1": {<br>    "cidr_base": "10.1.0.0",<br>    "mask": 25,<br>    "name": "Dmz1"<br>  },<br>  "Dmz2": {<br>    "cidr_base": "10.1.0.128",<br>    "mask": 25,<br>    "name": "Dmz2"<br>  },<br>  "Prod": {<br>    "cidr_base": "10.1.1.0",<br>    "mask": 24,<br>    "name": "Prod"<br>  }<br>}</pre> | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of the existing Vnet subnets will be created in. (create\_vnet=false) / Name of the new Vnet that will be created. (create\_vnet=true) | `string` | `"Terraform-CORE-VNET"` | no |
| <a name="input_virtual_network_rg_name"></a> [virtual\_network\_rg\_name](#input\_virtual\_network\_rg\_name) | Name of the resource group the existing Vnet is in. (create\_rg=false) / Name of the resource group the Vnet will be created in. (create\_rg=true). | `string` | `"Terraform-CORE-Networking"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_core_network_rg_id"></a> [core\_network\_rg\_id](#output\_core\_network\_rg\_id) | Output Resource Group ID. (Only if new resource group was created as part of this deployment) |
| <a name="output_core_vnet_id"></a> [core\_vnet\_id](#output\_core\_vnet\_id) | Output Azure Virtual Network ID. (Only if new Vnet was created as part of this deployment) |
<!-- END_TF_DOCS -->