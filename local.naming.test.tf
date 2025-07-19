


module "schema" {
  source = "./modules/naming-schema"

  default_naming = yamldecode(file("${path.root}/default.naming.yaml"))
  default_location = "westeurope"
  default_parameter = {
    environment = "DEVELOPMENT"
    name        = "TEST"
  }
}

module "naming_01" {
  source = "./modules/naming-generator"

  schema = module.schema
  index = {
    count = 10
  }

  resource = "azurerm_disk::os"
}


output "test" {
  value = {
    debug = module.naming_01.debug

    # schema = module.schema,

    single = module.naming_01.name

    multi = module.naming_01.by_index
  }

}
