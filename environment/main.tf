module "resource_group" {
  source = "../Module/azurerm_resource_group"
  AKS_rg = var.root_rg
}
module "storage_acc" {
  depends_on      = [module.resource_group]
  source          = "../Module/azurerm_storage_account"
  storage_account = var.root_storage

}
module "network" {
  depends_on      = [module.resource_group]
  source          = "../Module/azurerm_networking"
  virtual_network = var.root_network
}
module "sqlservers" {
  depends_on = [module.resource_group]
  source     = "../Module/azurerm_mssql_server"
  sql_server = var.root_server
  # sql_server_id  = var.sql_server_id

}
module "sqldatabase" {
  depends_on     = [module.sqlservers, module.resource_group]
  source         = "../Module/azurerm_mssql_database"
  mssql_database = var.root_database
  sql_server_ids = module.sqlservers.sql_server_ids
}
module "AKS_cluster" {
  depends_on = [module.resource_group, module.network, module.Application_gateway]
  source     = "../Module/azurerm_kubernetese_cluster"
  AKS        = var.root_AKS

}
module "AKS_Userpool" {
  depends_on   = [module.AKS_cluster, module.resource_group]
  source       = "../Module/azurerm_cluster_nodepool"
  aks_userpool = var.root_userpool
}
module "Loadbalancer" {
  depends_on     = [module.resource_group]
  source         = "../Module/azurerm_loadbalancer"
  load_balancers = var.root_load_balancers

}
module "CreateACR" {
  depends_on = [module.resource_group]
  source     = "../Module/azurerm_ACR"
  ACR        = var.root_acrs

}
module "Application_gateway" {
  depends_on = [module.network, module.resource_group]
  source     = "../Module/azurerm_application_gateway"
  app_gw     = var.root_appgtw

}
module "Access" {
  depends_on = [module.AKS_cluster, module.Application_gateway]
  source     = "../Module/Access"

}