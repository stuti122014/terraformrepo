resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.sql_server

  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  version                      = "12.0"
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password
}

