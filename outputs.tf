##################################################
# OUTPUTS                                        #
##################################################
output "core_network_rg_id" {
  value       = var.create_rg ? tostring(azurerm_resource_group.core_network_rg[0].id) : ""
  description = "Output Resource Group ID. (Only if new resource group was created as part of this deployment)"
}

output "core_vnet_id" {
  value       = var.create_vnet ? tostring(azurerm_virtual_network.core_vnet[0].id) : ""
  description = "Output Azure Virtual Network ID. (Only if new Vnet was created as part of this deployment)"
}