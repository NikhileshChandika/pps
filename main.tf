############## Launch Pad ################

terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=2.72.0"
    }
  }
}
    
provider "azurerm" {
  features {}
}
    
# terraform {
#   backend "azurerm" {}
# }
 
# data "azurerm_client_config" "current" {}

module "azure_sql" {
  source                        = "github.com/NikhileshChandika/terraform/modules/azure_sql"
  env                           = "meaz-dev-shared-apps"
  environment                   = "dev"
  project_code_name             = "pps"
  storage_account_name          = "meazdevshdappsppssql"
  sql_server_name               = "pps"
  sql_database_name             = "pps"
}
