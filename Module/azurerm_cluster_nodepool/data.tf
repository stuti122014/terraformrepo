data "azurerm_kubernetes_cluster" "cluster" {
    
name = "dev-nitor-cluster-01"
resource_group_name = "dev-nitor-rg-002"
  
}