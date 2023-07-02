##################################################
# VARIABLES                                      #
##################################################
variable "resourcegroupname" {
  type        = string
  default     = null
  description = "Required Input - Specify the resource group name that contains the Azure Vnet."
}
variable "virtualnetworkname" {
  type        = string
  default     = null
  description = "Required Input - Specify the Vnet name where subnets will be added."
}
variable "subscriptionid" {
  type        = string
  default     = null
  description = "Required Input - Subscription ID used for azurerm provider."
}
variable "subnet_config" {
  type = map(object({
    name      = string
    mask      = number
    cidr_base = string
  }))
  default     = {}
  description = "Required Input - Specify subnet configuration."
}