##################################################
# VARIABLES                                      #
##################################################
variable "resourcegroupname" {
  type        = string
  default     = null
  description = "Specify the resource group name that contains the Azure Vnet."
}
variable "virtualnetworkname" {
  type        = string
  default     = null
  description = "Specify the Vnet name where subnets will be added."
}
variable "subscriptionid" {
  type        = string
  default     = null
  description = "Subscription ID used for azurerm provider."
}
variable "subnet_config" {
  type = map(object({
    name      = string
    mask      = number
    cidr_base = string
  }))
  default     = {}
  description = "Specify subnet configuration."
}