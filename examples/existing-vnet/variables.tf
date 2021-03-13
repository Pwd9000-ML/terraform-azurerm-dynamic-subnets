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