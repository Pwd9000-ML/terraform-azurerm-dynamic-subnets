<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamic-subnets-test"></a> [dynamic-subnets-test](#module\_dynamic-subnets-test) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_ip"></a> [network\_ip](#input\_network\_ip) | Network IP to construct network address space. (Only in effect on newly created Vnet when variable:create\_vnet=true) | `string` | `null` | no |
| <a name="input_network_mask"></a> [network\_mask](#input\_network\_mask) | Network address mask to construct network address space. (Only in effect on newly created Vnet when variable:create\_vnet=true) | `number` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify Resource Group Name to create VNET in | `string` | `null` | no |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | Subnet Configuration | <pre>map(object({<br>    name      = string<br>    mask      = number<br>    cidr_base = string<br>  }))</pre> | `{}` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Specify a VNET nname | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->