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
variable "BillingCode" {
  type        = map(string)
  description = "Optional Input - Billing code map based on environment. (used for common tags defined in locals)"
  default = {
    Development = "100"
    UAT         = "101"
    QA          = "102"
    POC         = "103"
    Testing     = "104"
    Production  = "105"
  }
}
variable "CostCenter" {
  type        = map(string)
  description = "Optional Input - Cost center map based on line of business. (used for naming conventions defined in locals)"
  default = {
    IT          = "IT"
    Development = "DEV"
    Research    = "RND"
  }
}
variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "Optional Input - Set custom dns config. If no values specified, this defaults to Azure DNS (Only in effect on newly created Vnet when variable:create_vnet=true)"
}
variable "environment" {
  type        = string
  description = "Required Input - Value to describe the environment. Primarily used for tagging and naming resources. (used for naming conventions defined in locals)"
}
variable "lob" {
  type        = string
  description = "Required Input - Describes line of business. (used for naming conventions defined in locals; accepted values: IT, Development, Research)"
}
variable "location" {
  type        = string
  description = "Required Input - Location in azure where resources will be created. (ONLY accepted values [validation]: westeurope, centralus, eastasia)"
}
variable "network_ip" {
  type        = string
  description = "Required Input - Network IP to contrsuct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true)"
}
variable "network_mask" {
  type        = number
  description = "Required Input - Network address mask to contrsuct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true)"
}
variable "prefix" {
  type        = string
  default     = "Demo"
  description = "Required Input - Used for naming conventions defined in locals"
}
variable "region" {
  type        = map(string)
  description = "Optional Input - Regional map based on location. (used for naming conventions defined in locals)"
  default = {
    westeurope = "EMEA"
    centralus  = "NA"
    eastasia   = "APAC"
  }
}
variable "subscriptionid" {
  type        = string
  description = "Required Input - Subscription ID used for azurerm provider"
}
variable "subnet_config" {
  type        = map
  description = "Required Input - Subnet Configuration"
}

##################################################
# LOCALS                                         #
##################################################
locals {
  common_tags = {
    BillingCode    = var.BillingCode[var.environment]
    CostCenter     = var.CostCenter[var.lob]
    Environment    = var.environment
    LineOfBusiness = var.lob
    Region         = var.region[var.location]
  }
  coreResourceGroupName = "${var.prefix}-Core-Networking-${lower(var.CostCenter[var.lob])}"
  vnetName              = "${var.prefix}-Core-VNET-${lower(var.CostCenter[var.lob])}${random_integer.sa_num.result}"

  # Validation: 
  # This section validates input for location of available locations
  locations = {
    westeurope = "westeurope"
    centralus  = "centralus"
    eastasia   = "eastasia"
  }
  # Error is input variable "location" does not match locals location map
  validate_input_location = local.locations[var.location]
}

##################################################
# MODULES                                        #
##################################################
module "dynamic-subnets" {
  source = "github.com/Pwd9000-ML/terraform-azurerm-dynamic-subnets"
  providers = {
    azuread = azurerm.core_network
  }
  common_tags             = local.common_tags
  dns_entries             = var.dns_servers
  environment             = var.environment
  location                = var.location
  network_address_ip      = var.network_ip
  network_address_mask    = var.network_mask
  virtual_network_rg_name = local.coreResourceGroupName
  virtual_network_name    = local.vnetName
  subnet_config           = var.subnet_config
}

##################################################
# RESOURCES                                      #
##################################################
resource "random_integer" "sa_num" {
  min = 0001
  max = 9999
}