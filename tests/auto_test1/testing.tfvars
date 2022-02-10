### Testing variables ###

#Vnet base IP address (When new VNET is created)
network_ip = "10.2.0.0"

#Vnet mask (When new VNET is created)
network_mask = 22

#Resource Group Name to be created
resource_group_name = "TF-Module-Automated-Tests-Dyn-Subnets"

#VNET Name to be created
vnet_name = "TF-VNET-TEST"

#Subnet Configuration maps.
subnet_config = {
  Dmz1 = {
    name      = "Dmz1"
    mask      = 25
    cidr_base = "10.2.0.0"
  }
  Dmz2 = {
    name      = "Dmz2"
    mask      = 25
    cidr_base = "10.2.0.128"
  }
  Prod = {
    name      = "Prod"
    mask      = 24
    cidr_base = "10.2.1.0"
  }
  Dev = {
    name      = "Dev"
    mask      = 24
    cidr_base = "10.2.2.0"
  }
}
