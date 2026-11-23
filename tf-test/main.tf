terraform {                                            #Use the Azure provider (azurerm)
  required_providers {                                 #Download it from HashiCorp 
    azurerm = {                                        #Use version 4.x
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {                     #Configures the Azure provider
  features {}
}

data "azurerm_client_config" "me" {}     #Reads information about the currently logged-in Azure account.

output "subscription" {                  #Display the subscription ID after Terraform runs.
  value = data.azurerm_client_config.me.subscription_id
}