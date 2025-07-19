#########################################################
#
# The main virutal network
#
#

name           = "main"
address_prefix = "10.0.10.0/24"

# File filter for the nsg files. Like in a subfolder: ./nsg/nsg.*.tfvars
file_filter_nsg = "./nsg/nsg.*.tfvars"

subnet = {
  #
  # The subnet for deploying the appservices
  #
  appgateway = {
    name              = "appgateway"
    address_prefix    = "10.0.10.0/28"
    service_endpoints = []
    delegations       = []
  }
}
