resource "azurerm_kubernetes_cluster" "aks" {
   for_each = var.AKS
  name = each.value.aks_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix = each.value.dns_prefix
  default_node_pool {
    name = each.value.default_node_pool
    vm_size = each.value.vm_size
    node_count = each.value.node_count
  }
   identity {
    type = "SystemAssigned"
  }
  tags = { 
    enviroment = each.value.enviroment_name
    }
}
