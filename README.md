# Module: Dynamic Subnets

## Description

Create dynamic subnets based on a subnet input config/variable input, on an existing or new Azure Virtual Network using Terraform.  
This module can be used to do the following subnet tasks based on input:  

- Create a new resource group and Vnet and populate with subnets based on input variable subnet config.
- Create a new Vnet in an existing resource group and populate with subnets based on input variable subnet config.
- Populate subnets dynamically onto an existing Vnet in an existing resource group based on input variable subnet config.
  
## Providers and terraform version requirements
  
- terraform version ~> 0.12.19
- provider "azurerm" ~> 1.39.0
  
## Module Input variables

- common_tags - (Optional) A map of key value pairs that is used to tag resources created. (Default: demo map).
- create_rg - (Optional) Create a new resource group for this deployment. (Set to false to use existing resource group).
- create_vnet - (Optional) Create a new Azure Virtual Network for this deployment. (Set to false to use existing Azure Virtual Network).
- dns_entries - (Optional) Set custom dns config. If no values specified, this defaults to Azure DNS (Only in effect on newly created Vnet when variable:create_vnet=true).
- environment - (Optional) Value to describe the environment. Used for tagging. (Default: Development).
- location - (Optional) Location in azure where resources will be created. (Only in effect on newly created Resource Group when variable:create_rg=true).
- network_address_ip - (Optional) Network base IP to contrsuct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true).
- network_address_mask - (Optional) Network address mask to contrsuct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true).
- virtual_network_rg_name - (Optional) Name of the resource group the existing Vnet is in. (create_rg=false) / Name of the resource group the Vnet will be created in. (create_rg=true).
- virtual_network_name - (Optional) Name of the existing Vnet subnets will be created in. (create_vnet=false) / Name of the new Vnet that will be created. (create_vnet=true).
- subnet_config - (Optional) Subnet config maps for each subnet to be created in either existing or newly created VNET based on. (create_vnet=true/false).
  
## Module Outputs

Module outputs are only generated for new resources created in this module e.g. Resource Group and/or Azure Virtual network.  
Outputs are not generated if subnets are populated on an existing Azure Virtual Network.  

- core_network_rg_id - Output Resource Group ID. (Only if new resource group was created as part of this deployment).
- core_vnet_id -  Output Azure Virtual Network ID. (Only if new Vnet was created as part of this deployment).

## Example 1

Simple example where a new Resource Group and Vnet will be created (Default).  
This example requires no input and will create a new resource group and vnet populated with demo subnets based on the default input variables.  

```hcl
provider "azurerm" {
    version = "~>1.38.0"
}

module "dynamic-subnets" {
    source  = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
}
```

## Example 2

Simple example where a new Vnet with custom DNS will be created in an existing resource group.  
This example requires an exisitng resource group and will create a new vnet populated with demo subnets based on the default input variables.  

```hcl
provider "azurerm" {
    version = "~>1.38.0"
}

module "dynamic-subnets" {
    create_rg               = false     #Existing VNET Resource group name must be provided.
    virtual_network_rg_name = "Core-Networking-Rg"
    dns_entries             = ["10.1.0.10", "10.1.0.138"]
    source                  = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
}
```

## Example 3

Simple example where subnets are populated dynamically onto an existing Vnet.  
This example requires an exisitng resource group and will create a new vnet populated with demo subnets based on the default input variables.  
This example asumes a network address space of "10.1.0.0/22" with no subnets.  
For more advanced examples see: [examples](https://github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets/tree/master/examples)  

```hcl
provider "azurerm" {
    version = "~>1.38.0"
}

module "dynamic-subnets" {
    create_rg               = false     #Existing VNET Resource group name must be provided.
    create_vnet             = false     #Existing VNET name must be provided.
    virtual_network_rg_name = "Core-Networking-Rg"
    virtual_network_name    = "Core-VNET-9000"
    source                  = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
}
```
