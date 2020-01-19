# Terraform Example - Add subnets on existing Azure Vnet

## Description

The following example files can be used to demo the module called dynamic-subnets.  
This example can be used to populate an existing VNET with custom subnets based on a provided subnet config file called "subnet_config.auto.tfvars".  
The values used from "subnet_config.auto.tfvars" in this example assumes an existing VNET with a network address space of 10.2.0.0/22.  
It is also assumed that the existing network in this example has no subnets configured.  
The existing resource group name in this example is: "Core-Networking-Rg".  
The existing vnet name in this example is: "Core-VNET-9000".  
The example contains:  

- Main terraform file (main.tf).
- Common variables defining the existing resources. (common.auto.tfvars).
- Subnet configuration used for subnets to be added. (subnet_config.auto.tfvars).

The main.tf and .tfvars files can be amended to specify the existing resource group and VNET as described in the module readme.  
Amend "common.auto.tfvars" with relevant SubscriptionID and resources that will be used with the azurerm provider.  
Amend "subnet_config.auto.tfvars" to populate the existing VNET with relevant subnets.  

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.  
2. Amend the main.tf and .tfvars files with desired values.  
3. Log into azure using CLI "az login".  
4. run: Terraform init  
5. run: Terraform plan -out .\subnets.tfplan  
6. run: Terraform apply .\subnets.tfplan  
7. run: Terraform destroy (optional - This will destroy all resources created with step #6)  

## Providers and terraform version requirements
  
- terraform version ~> 0.12.19
- provider "azurerm" ~>1.38.0
  
## Root module Input variables
  
- resourcegroupname - (Required) Specify the resource group name that contains the Azure Vnet.
- virtualnetworkname - (Required) Specify the Vnet name where subnets will be added.
- subscriptionid - (Required) Subscription ID used for azurerm provider.
- subnet_config - (Required) Specify subnet configuration.
