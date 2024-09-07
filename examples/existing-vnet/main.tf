terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-example1.tfstate" }
}

##################################################
# PROVIDERS                                      #
##################################################
provider "azurerm" {
  features {}
  alias           = "core_network"
  subscription_id = var.subscriptionid
}

##################################################
# MODULES                                        #
##################################################
module "dynamic-subnets" {
  source  = "Pwd9000-ML/dynamic-subnets/azurerm"
  version = ">= 1.2.0"
  providers = {
    azurerm = azurerm.core_network
  }
  create_rg               = false
  create_vnet             = false
  virtual_network_rg_name = var.resourcegroupname
  virtual_network_name    = var.virtualnetworkname
  subnet_config           = var.subnet_config
}
