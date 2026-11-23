
# STEP 1: Configure the Azure provider
# Terraform uses the AzureRM provider to communicate with Azure.
provider "azurerm" {

  # Enables the provider's built-in Azure resource management features.
  features {}

  # Specifies the Azure subscription where resources will be created.
  subscription_id = "give ur subscription"
}


# STEP 2: Create an Azure Resource Group
# A Resource Group is a logical container used to organize Azure resources.
resource "azurerm_resource_group" "rg" {

  # Name of the Resource Group that will appear in the Azure portal.
  name = "namee"

  # Azure region where the Resource Group will be created.
  location = "Central India"
}


# STEP 3: Create an Azure Storage Account
# A Storage Account provides storage services such as blobs, files and queues.
resource "azurerm_storage_account" "stg" {

  # Globally unique name for the Storage Account.
  # Must be lowercase letters and numbers, between 3 and 24 characters.
  name = "name"

  # Connects this Storage Account to the Resource Group created in STEP 2.
  # Terraform automatically understands this dependency.
  resource_group_name = azurerm_resource_group.rg.name

  # Uses the same Azure region as the Resource Group.
  location = azurerm_resource_group.rg.location

  # Standard: Defines the performance tier of the Storage Account.
  account_tier = "Standard"

  # LRS: Locally Redundant Storage.
  # Keeps multiple copies of data within a single physical location.
  account_replication_type = "LRS"
}
