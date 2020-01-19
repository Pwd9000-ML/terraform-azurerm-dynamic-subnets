terraform {
  required_version = "~> 0.12.19"
  required_providers {
    azurerm = "~> 1.38.0"
  }
}

##################################################
# DATA                                           #
##################################################
data "azurerm_resource_group" "core_network_rg" {
  count = var.create_rg != true ? 1 : 0
  name  = var.virtual_network_rg_name
}

data "azurerm_virtual_network" "core_vnet" {
  count               = var.create_vnet != true ? 1 : 0
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_rg_name
}

##################################################
# LOCALS                                         #
##################################################
locals {
  address_space = join("/", [var.network_address_ip, tostring(var.network_address_mask)])
  dynamic_subnets = [
    for map in var.subnet_config : {
      subnet_name  = map.name
      cidr_block   = join("/", [map.cidr_base, tostring(map.mask)])
    }
  ]
}

##################################################
# RESOURCES                                      #
##################################################
resource "azurerm_resource_group" "core_network_rg" {
  count    = var.create_rg ? 1 : 0
  name     = var.virtual_network_rg_name
  location = var.location
  tags     = merge(var.common_tags, { Purpose = "Terraform-Core-Networking-${var.environment}" })
}

resource "azurerm_virtual_network" "core_vnet" {
  count               = var.create_vnet ? 1 : 0
  name                = var.virtual_network_name
  location            = var.create_rg ? tostring(azurerm_resource_group.core_network_rg[0].location) : tostring(data.azurerm_resource_group.core_network_rg[0].location)
  resource_group_name = var.create_rg ? tostring(azurerm_resource_group.core_network_rg[0].name) : tostring(data.azurerm_resource_group.core_network_rg[0].name)
  address_space       = [local.address_space]
  dns_servers         = var.dns_entries
  tags                = merge(var.common_tags, { Purpose = "Terraform-Core-Vnet-${var.environment}" })
}

resource "azurerm_subnet" "dynamic" {
  for_each = {
    for subnet in local.dynamic_subnets : "${subnet.subnet_name}.${subnet.cidr_block}" => subnet
  }

  name                 = each.value.subnet_name
  resource_group_name  = var.create_rg ? tostring(azurerm_resource_group.core_network_rg[0].name) : tostring(data.azurerm_resource_group.core_network_rg[0].name)
  virtual_network_name = var.create_vnet ? tostring(azurerm_virtual_network.core_vnet[0].name) : tostring(data.azurerm_virtual_network.core_vnet[0].name)
  address_prefix       = each.value.cidr_block
}