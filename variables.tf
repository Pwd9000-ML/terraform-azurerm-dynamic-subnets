##################################################
# VARIABLES                                      #
##################################################
variable "common_tags" {
  type = map(string)
  default = {
    Terraform   = "True"
    Description = "This is a demo built with Terraform"
  }
  description = "A map of key value pairs that is used to tag resources created. (Default: demo map)"
}

variable "create_rg" {
  type        = bool
  default     = true
  description = "Create a new resource group for this deployment. (Set to false to use existing resource group)"
}

variable "create_vnet" {
  type        = bool
  default     = true
  description = "Create a new Azure Virtual Network for this deployment. (Set to false to use existing Azure Virtual Network)"
}

variable "dns_entries" {
  type        = list(string)
  default     = []
  description = "Set custom dns config. If no values specified, this defaults to Azure DNS (Only in effect on newly created Vnet when variable:create_vnet=true)"
}

variable "environment" {
  type        = string
  default     = "Development"
  description = "Value to describe the environment. Used for tagging. (Default: Development)"
}

variable "location" {
  type        = string
  default     = "uksouth"
  description = "Location in azure where resources will be created. (Only in effect on newly created Resource Group when variable:create_rg=true)"
}

variable "network_address_ip" {
  type        = string
  default     = "10.1.0.0"
  description = "Network IP to construct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true)"
}

variable "network_address_mask" {
  type        = number
  default     = 22
  description = "Network address mask to construct network address space. (Only in effect on newly created Vnet when variable:create_vnet=true)"
}

variable "virtual_network_rg_name" {
  type        = string
  default     = "Terraform-CORE-Networking"
  description = "Name of the resource group the existing Vnet is in. (create_rg=false) / Name of the resource group the Vnet will be created in. (create_rg=true)."
}

variable "virtual_network_name" {
  type        = string
  default     = "Terraform-CORE-VNET"
  description = "Name of the existing Vnet subnets will be created in. (create_vnet=false) / Name of the new Vnet that will be created. (create_vnet=true)"
}

variable "subnet_config" {
  type = map(object({
    name      = string
    mask      = number
    cidr_base = string
  }))
  default = {
    Dmz1 = {
      name      = "Dmz1"
      mask      = 25
      cidr_base = "10.1.0.0"
    }
    Dmz2 = {
      name      = "Dmz2"
      mask      = 25
      cidr_base = "10.1.0.128"
    }
    Prod = {
      name      = "Prod"
      mask      = 24
      cidr_base = "10.1.1.0"
    }
    Dev = {
      name      = "Dev"
      mask      = 24
      cidr_base = "10.1.2.0"
    }
  }
  description = "Subnet config map for each subnet to be created in either existing or newly created VNET based on. (create_vnet=true/false)"
}