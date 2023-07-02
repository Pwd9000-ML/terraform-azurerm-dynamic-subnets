# Terraform Example - Add subnets on existing Azure VNET

## Description

The following example files can be used to demo the module called dynamic-subnets.  
This example can be used to populate an existing VNET with custom subnets based on a provided subnet config file: `subnet_config.auto.tfvars`.  
The values used from `subnet_config.auto.tfvars` in this example assumes an existing VNET with a network address space of `10.2.0.0/22`.  
It is also assumed that the existing network in this example has no subnets configured.  
The existing resource group name in this example is: `Core-Networking-Rg`".  
The existing vnet name in this example is: `Core-VNET-9000`.  
The example contains:  

- Main terraform file: `main.tf`.
- Variables file: `variables.tf`.
- Common variables defining the existing resources: `common.auto.tfvars`.
- Subnet configuration used for subnets to be added: `subnet_config.auto.tfvars`.

`main.tf` and `.tfvars` files can be amended to specify the existing resource group and VNET as described in the module readme.  
Amend `common.auto.tfvars` with relevant `SubscriptionID` and resources that will be used with the azurerm provider.  
Amend `subnet_config.auto.tfvars` to populate the existing VNET with specified subnets.  

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.
2. Amend the .tf file and .tfvars file with desired variables.
3. Log into azure using CLI "az login".
4. **BUILD:**

    ```hcl
    terraform init
    terraform plan -out deploy.tfplan
    terraform apply deploy.tfplan
    ```

5. **DESTROY:**

    ```hcl
    terraform plan -destroy -out destroy.tfplan
    terraform apply destroy.tfplan
    ```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamic-subnets"></a> [dynamic-subnets](#module\_dynamic-subnets) | github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resourcegroupname"></a> [resourcegroupname](#input\_resourcegroupname) | Required Input - Specify the resource group name that contains the Azure Vnet. | `string` | `null` | no |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | Required Input - Specify subnet configuration. | <pre>map(object({<br>    name      = string<br>    mask      = number<br>    cidr_base = string<br>  }))</pre> | `{}` | no |
| <a name="input_subscriptionid"></a> [subscriptionid](#input\_subscriptionid) | Required Input - Subscription ID used for azurerm provider. | `string` | `null` | no |
| <a name="input_virtualnetworkname"></a> [virtualnetworkname](#input\_virtualnetworkname) | Required Input - Specify the Vnet name where subnets will be added. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->