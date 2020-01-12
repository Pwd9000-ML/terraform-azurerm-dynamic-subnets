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
  
To be completed
  
## Module Outputs

To be completed

## Other requirements

To be completed

## Example

This example requires no input and will create a new resource group and vnet populated with demo subnets based on the default input variables.

```hcl
provider "azuread" {}

module "dynamic-subnets" {
    source                       = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
}
```
