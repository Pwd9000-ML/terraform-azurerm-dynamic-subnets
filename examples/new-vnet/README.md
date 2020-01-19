# Terraform Example - Subnets on a new Azure Vnet

## Description

This example can be used to create a new resource group and VNET with custom DNS and populate the VNET with custom subnets based on a provided subnet config.  
The following example files can be used to demo the module called dynamic-subnets.  
This example uses the default values "create_rg=true" and "create_vnet=true" on the dynamic-subnets module called to create a new resource group and VNET.  
The example contains:  

- Main terraform file (main.tf).
- Common variables used for tagging, naming and VNET resources excluding subnets (common.auto.tfvars).
- Subnet configuration used for subnets (subnet_config.auto.tfvars).

The main.tf and .tfvars files can be amended to create a new resource group and VNET as described in the module readme.  
Amend "common.auto.tfvars" with relevant SubscriptionID and network config that will be used with the azurerm provider.  
Amend "subnet_config.auto.tfvars" to populate the newly created VNET with relevant subnets.  

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.  
2. Amend the main.tf and .tfvars files with desired values.  
3. Log into azure using CLI "az login".  
4. run: Terraform init  
5. run: Terraform plan -out .\newvnet.tfplan  
6. run: Terraform apply .\newvnet.tfplan  
7. run: Terraform destroy (optional - This will destroy all resources created with step #6)  

## Providers and terraform version requirements
  
- terraform version ~> 0.12.19
- provider "azurerm" ~>1.38.0
  
## Root module input variables
  
- BillingCode - (Otional) Billing code map based on environment. (Used for common tags defined in locals).
- CostCenter - (Optional) Cost center map based on line of business. (Used for naming conventions defined in locals).
- dns_servers - (Optional) Set custom dns config. If no values specified, this defaults to Azure DNS.
- environment - (Required) Value to describe the environment. Primarily used for tagging and naming resources. (Used for naming conventions defined in locals).
- lob - (Required) Describes line of business. (Used for naming conventions defined in locals; e.g. IT, Development, Research).
- location - (Required) Location in azure where resources will be created. (ONLY accepted values [validation]: westeurope, centralus, eastasia).
- network_ip - (Required) Network IP to contrsuct network address space.
- network_mask - (Required) Network address mask to contrsuct network address space.
- prefix - (Optional) Used for naming conventions defined in locals.
- region - (Optional) Regional map based on location. (Used for naming conventions defined in locals).
- subscriptionid - (Required) Subscription ID used for azurerm provider.
- subnet_config - (Required) Subnet Configuration. (See subnet_config.auto.tfvars)

## Sub module outputs

Module outputs are only generated for new resources created in this module e.g. Resource Group and/or Azure Virtual network.  

- core_network_rg_id - Output Resource Group ID. (New resource group ID created as part of this deployment).
- core_vnet_id -  Output Azure Virtual Network ID. (New Vnet ID created as part of this deployment).
