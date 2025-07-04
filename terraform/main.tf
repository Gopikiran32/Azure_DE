
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-data-pipeline"
  location = "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "datapipelinestorage123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "raw-data"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = "sqlserveretl2025"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "StrongPassword123!"
}

resource "azurerm_sql_database" "sqldb" {
  name                = "salesdb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  requested_service_objective_name = "Basic"
}

resource "azurerm_data_factory" "adf" {
  name                = "datafactoryetl"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "sql_server_name" {
  value = azurerm_sql_server.sqlserver.name
}
