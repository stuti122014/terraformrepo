# module "resource_group" {
#   source = "../../Module/azurerm_resource_group"
#  AKS_rg = var.sandboxroot_rg
# }
# module "AKS_cluster" {
#     depends_on = [ module.resource_group ]
#     source = "../../Module/azurerm_kubernetese_cluster"
#     AKS = var.sandboxroot_aks
  
# } 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  
}
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  minimum_tls_version = "1.2"
}

resource "azurerm_mssql_database" "database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "Basic"
}

