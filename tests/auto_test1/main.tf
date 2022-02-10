
terraform {
  backend "local" {}
}

provider "azurerm" {
  features {}
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "dynamic-subnets-test" {
  source                  = "../.."
  network_address_ip      = var.network_ip
  network_address_mask    = var.network_mask
  virtual_network_rg_name = var.resource_group_name
  virtual_network_name    = var.vnet_name
  subnet_config           = var.subnet_config
}