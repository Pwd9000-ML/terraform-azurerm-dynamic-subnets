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
  source = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
  providers = {
    azurerm = azurerm.core_network
  }
  create_rg               = false
  create_vnet             = false
  virtual_network_rg_name = var.resourcegroupname
  virtual_network_name    = var.virtualnetworkname
  subnet_config           = var.subnet_config
}
