
run "setup" {
  module {
    source = "./helper/setup"
  }
}

variables {

  convention = "default"

  location = "westeurope"

  naming = {
    environment = "test"
    name        = "tftest"
  }

}



run "virtual_network" {
  command = plan
  plan_options {
    mode = normal
    refresh = false
    replace = []
    target  = []
  }

  variables {
    resource_group_reference = setup.resource_group_reference
    resource = "azurerm_virtual_network"
  }

  # verify that the generated name is correct.
  assert {
    condition     = output.result == "vnet-euwe-test-tftest-01"
    error_message = "Generated Name is Invalid"
  }
}