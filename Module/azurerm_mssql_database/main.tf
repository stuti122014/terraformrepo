resource "azurerm_mssql_database" "mssql_database" {
  # server_id = var.sql_server_id
  for_each = var.mssql_database
  name         = each.value.database_name
  # server_id = var.sql_server_ids[each.value.server_key]
  server_id  = var.sql_server_ids
  sku_name     = each.value.sku_name
  
}