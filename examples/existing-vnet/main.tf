##################################################
# PROVIDERS                                      #
##################################################
provider "azurerm" {
  alias           = "core_network"
  subscription_id = var.subscriptionid
  version         = "~>1.38.0"
}

##################################################
# VARIABLES                                      #
##################################################
variable "resourcegroupname" {
  type        = string
  description = "Required Input - Specify the resource group name that contains the Azure Vnet."
}
variable "virtualnetworkname" {
  type        = string
  description = "Required Input - Specify the Vnet name where subnets will be added."
}
variable "subscriptionid" {
  type        = string
  description = "Required Input - Subscription ID used for azurerm provider."
}
variable "subnet_config" {
  type        = map
  description = "Required Input - Specify subnet configuration."
}

##################################################
# MODULES                                        #
##################################################
module "dynamic-subnets" {
  source = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
  providers = {
    azuread = azurerm.core_network
  }
  create_rg               = false
  create_vnet             = false
  virtual_network_rg_name = var.resourcegroupname
  virtual_network_name    = var.virtualnetworkname
  subnet_config           = var.subnet_config
}
