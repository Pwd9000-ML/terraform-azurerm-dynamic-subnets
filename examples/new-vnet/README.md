# Terraform Example - Subnets on a new Azure Vnet

## Description

This example can be used to create a new resource group and VNET with custom DNS and populate the VNET with custom subnets based on a provided subnet config.  
The following example files can be used to demo the module: `dynamic-subnets`.  
This example uses the default values: `create_rg=true` and `create_vnet=true` on the `dynamic-subnets` module called to create a new resource group and VNET.  
The example contains:  

- Main terraform file: `main.tf`.
- Variables file: `variables.tf`.
- Common variables used for tagging, naming and VNET resources excluding subnets: `common.auto.tfvars`.
- Subnet configuration used for subnets: `subnet_config.auto.tfvars`.

`main.tf` and `.tfvars` files can be amended to create a new resource group and VNET as described in the module readme.  
Amend `common.auto.tfvars` with relevant `SubscriptionID` and network config that will be used with the azurerm provider.  
Amend `subnet_config.auto.tfvars` to populate the newly created VNET with relevant subnets.  

## Usage

1. Clone or copy the two files in this path to a local directory and open a command prompt.
2. Amend the .tf file and .tfvars file with desired variables.
3. Log into azure using CLI "az login".
4. **BUILD:**

    ```HCL
    terraform init
    terraform plan -out deploy.tfplan
    terraform apply deploy.tfplan
    ```

5. **DESTROY:**

    ```HCL
    terraform plan -destroy -out destroy.tfplan
    terraform apply destroy.tfplan
    ```
  
## Root module input variables
  
- `billing_code` - (Optional) Billing code map based on environment. (Used for common tags defined in locals).
- `cost_center` - (Optional) Cost center map based on line of business. (Used for naming conventions defined in locals).
- `dns_servers` - (Optional) Set custom dns config. If no values specified, this defaults to Azure DNS.
- `environment` - (Required) Value to describe the environment. Primarily used for tagging and naming resources. (Used for naming conventions defined in locals).
- `lob` - (Required) Describes line of business. (Used for naming conventions defined in locals; e.g. IT, Development, Research).
- `location` - (Required) Location in azure where resources will be created. (ONLY accepted values [validation]: uksouth, westeurope, centralus, eastasia).
- `network_ip` - (Required) Network IP to construct network address space.
- `network_mask` - (Required) Network address mask to construct network address space.
- `prefix` - (Optional) Used for naming conventions defined in locals.
- `region` - (Optional) Regional map based on location. (Used for naming conventions defined in locals).
- `subscriptionid` - (Required) Subscription ID used for azurerm provider.
- `subnet_config` - (Required) Subnet Configuration. (See subnet_config.auto.tfvars)

## Sub module outputs

Module outputs are only generated for new resources created in this module e.g. Resource Group and/or Azure Virtual network.  

- `core_network_rg_id` - Output Resource Group ID. (New resource group ID created as part of this deployment).
- `core_vnet_id` -  Output Azure Virtual Network ID. (New Vnet ID created as part of this deployment).
