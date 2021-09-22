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
    
terraform {
  backend "azurerm" {
    subscription_id  = "f68c820e-5476-4bfb-9a9a-7be3c4be81f2"
    resource_group_name  = "meaz-prd-hub-inf-terraform-rg"
    storage_account_name = "meazprdhubinfterraformsa"
    container_name       = "meazprdhubinfterraformstate"
    key                  = "pps.terraform.tfstate"
  }
}
 
data "azurerm_client_config" "current" {}

module "azure_sql" {
  source                        = "github.com/NikhileshChandika/terraform/modules/azure_sql"
  env                           = "meaz-dev-shared-apps"
  environment                   = "dev"
  project_code_name             = "pps"
  storage_account_name          = "meazdevsharedappsppssqlsa"
  sql_server_name               = "pps"
  sql_database_name             = "pps"
}
