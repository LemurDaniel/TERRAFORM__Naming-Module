#########################################################
#
# The application gateway
#
#

name = null
sku = {
  name = "Standard_v2"
  tier = "Standard_v2"
}

network = {
  subnet_key = "appgateway"
}

backend_pool = {
  "google" = {
    protocol = "Http"
    fqdn     = "google.com"
  }
}

frontend_listener = {
  "google" = {
    protocol     = "Http"
    backend_pool = "google"
  }
}
