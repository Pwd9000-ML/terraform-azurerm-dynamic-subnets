#Subnet Configuration
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