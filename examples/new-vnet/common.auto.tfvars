#Custom DNS for VNet (When new VNET is created)
dns_servers = ["10.2.0.10", "10.2.0.138"]

#e.g. Development, UAT, QA, POC, Testing, Production
environment = "Testing"

#e.g. IT, Development, Research
lob = "Development"

#e.g. westeurope, centralus, eastasia (input validated)
location = "westeurope"

#Vnet base IP address (When new VNET is created)
network_ip = "10.2.0.0"

#Vnet mask (When new VNET is created)
network_mask = 22

#Global prefix
prefix = "Demo"

#Subscription Id
subscriptionid = "00000000-0000-0000-0000-00000000000"
