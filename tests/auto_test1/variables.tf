##################################################
# VARIABLES                                      #
##################################################
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

variable "resource_group_name" {
  type        = string
  default     = null
  description = "Specify Resource Group Name to create VNET in"
}

variable "vnet_name" {
  type        = string
  default     = null
  description = "Specify a VNET nname"
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