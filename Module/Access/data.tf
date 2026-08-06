data "azurerm_kubernetes_cluster" "aks11" {
  name                = "dev-nitor-cluster-01"
  resource_group_name = "dev-nitor-rg-002"
}
data "azurerm_application_gateway" "apgw1" {
  name = "dev-nitor-appgw-01" 
  resource_group_name = "dev-nitor-rg-002"
}