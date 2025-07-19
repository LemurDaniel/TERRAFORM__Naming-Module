

module "naming" {
  source = "../naming-generator"

  resource = "azurerm_resource_group"

  location = var.location
  parameters = var.naming

  schema = var.naming_schema
}

resource "azurerm_resource_group" "main" {
  name     = module.naming.result
  location = var.location

  tags = var.tags
}
