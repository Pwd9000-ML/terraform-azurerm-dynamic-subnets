##################################################
# VARIABLES                                      #
##################################################
variable "billing_code" {
  type = map(string)
  default = {
    Development = "100"
    UAT         = "101"
    QA          = "102"
    POC         = "103"
    Testing     = "104"
    Production  = "105"
  }
  description = "Billing code map based on environment. (used for common tags defined in locals)"
}
variable "cost_center" {
  type = map(string)
  default = {
    IT          = "IT"
    Development = "DEV"
    Research    = "RND"
  }
  description = "Cost center map based on line of business. (used for naming conventions defined in locals)"
}
variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "Set custom dns config. If no values specified, this defaults to Azure DNS (Only in effect on newly created Vnet when variable:create_vnet=true)"
}
variable "environment" {
  type        = string
  default     = "Development"
  description = "Value to describe the environment. Primarily used for tagging and naming resources. (used for naming conventions defined in locals)"
}
variable "lob" {
  type        = string
  default     = "IT"
  description = "Describes line of business. (used for naming conventions defined in locals; accepted values: IT, Development, Research)"
}
variable "location" {
  type        = string
  default     = "uksouth"
  description = "Location in azure where resources will be created. (ONLY accepted values [validation]: westeurope, centralus, eastasia)"
}
variable "network_ip" {
  type        = string
  default     = null
  description = "Network IP to construct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true)"
}
variable "network_mask" {
  type        = number
  default     = null
  description = "Network address mask to construct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true)"
}
variable "prefix" {
  type        = string
  default     = "Demo"
  description = "Used for naming conventions defined in locals"
}
variable "region" {
  type        = map(string)
  description = "Regional map based on location. (used for naming conventions defined in locals)"
  default = {
    westeurope = "EMEA"
    centralus  = "NA"
    eastasia   = "APAC"
    uksouth    = "UK"
  }
}
variable "subscriptionid" {
  type        = string
  default     = null
  description = "Subscription ID used for azurerm provider"
}
variable "subnet_config" {
  type = map(object({
    name      = string
    mask      = number
    cidr_base = string
  }))
  default     = {}
  description = "Subnet Configuration"
}