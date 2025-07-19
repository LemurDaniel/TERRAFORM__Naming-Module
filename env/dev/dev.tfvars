


project_name = "modules"
location     = "westeurope"
environment  = "dev"
tags         = {}


config_path_base = "./env/dev"

resource_group = {

  recovery = {
    name        = "recovery"
    config_path = "./rg-recovery"
  }

  networking = {
    name        = "network"
    config_path = "./rg-networking"
  }

  container = {
    name        = "container"
    config_path = "./rg-container"
  }

  appgateway = {
    name        = "appgateway"
    config_path = "./rg-appgateway"
  }
}

