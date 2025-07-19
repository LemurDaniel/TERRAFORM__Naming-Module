/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Common outputs for the resource group module.
  - id: The ID of the resource group.
  - name: The name of the resource group.
  - tags: The tags applied to the resource group.
  - location: The location of the resource group.
*/

output "id" {
  value = azurerm_resource_group.main.id
}

output "name" {
  value = azurerm_resource_group.main.name
}

output "tags" {
  value = var.tags
}

output "location" {
  value = azurerm_resource_group.main.location
}

/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Reference to the naming module.

  When creating a module group by resource group.
  Then provide the reference to the naming module from the resource group module.
*/

output "naming_ref" {
  value = module.naming.configuration
}
