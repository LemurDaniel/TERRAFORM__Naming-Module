
terraform {

  cloud {
    organization = "landau-daniel-1998-test"

    workspaces {
      project = "custom-modules"
      name    = "custom-modules-naming"
    }
  }

  required_version = ">=1.8.0"
  required_providers {
    terraform = {
      source = "terraform.io/builtin/terraform"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.107.0"
    }
  }

}


provider "azurerm" {
  subscription_id = "6ad43a20-9532-41c0-ad61-885a26bef90f"

  features {

  }
}
