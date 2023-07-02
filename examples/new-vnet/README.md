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

1. Clone or copy the files in this path to a local directory and open a command prompt.
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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamic-subnets"></a> [dynamic-subnets](#module\_dynamic-subnets) | github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets | n/a |

## Resources

| Name | Type |
|------|------|
| [random_integer.sa_num](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_code"></a> [billing\_code](#input\_billing\_code) | Optional Input - Billing code map based on environment. (used for common tags defined in locals) | `map(string)` | <pre>{<br>  "Development": "100",<br>  "POC": "103",<br>  "Production": "105",<br>  "QA": "102",<br>  "Testing": "104",<br>  "UAT": "101"<br>}</pre> | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | Optional Input - Cost center map based on line of business. (used for naming conventions defined in locals) | `map(string)` | <pre>{<br>  "Development": "DEV",<br>  "IT": "IT",<br>  "Research": "RND"<br>}</pre> | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Optional Input - Set custom dns config. If no values specified, this defaults to Azure DNS (Only in effect on newly created Vnet when variable:create\_vnet=true) | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Required Input - Value to describe the environment. Primarily used for tagging and naming resources. (used for naming conventions defined in locals) | `string` | n/a | yes |
| <a name="input_lob"></a> [lob](#input\_lob) | Required Input - Describes line of business. (used for naming conventions defined in locals; accepted values: IT, Development, Research) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Required Input - Location in azure where resources will be created. (ONLY accepted values [validation]: westeurope, centralus, eastasia) | `string` | n/a | yes |
| <a name="input_network_ip"></a> [network\_ip](#input\_network\_ip) | Required Input - Network IP to construct network address space. (Only in effect on newly created Vnet when variable:create\_vnet=true) | `string` | n/a | yes |
| <a name="input_network_mask"></a> [network\_mask](#input\_network\_mask) | Required Input - Network address mask to construct network address space. (Only in effect on newly created Vnet when variable:create\_vnet=true) | `number` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Required Input - Used for naming conventions defined in locals | `string` | `"Demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | Optional Input - Regional map based on location. (used for naming conventions defined in locals) | `map(string)` | <pre>{<br>  "centralus": "NA",<br>  "eastasia": "APAC",<br>  "uksouth": "UK",<br>  "westeurope": "EMEA"<br>}</pre> | no |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | Required Input - Subnet Configuration | <pre>map(object({<br>    name      = string<br>    mask      = number<br>    cidr_base = string<br>  }))</pre> | n/a | yes |
| <a name="input_subscriptionid"></a> [subscriptionid](#input\_subscriptionid) | Required Input - Subscription ID used for azurerm provider | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->