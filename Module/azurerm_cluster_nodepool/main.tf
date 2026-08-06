resource "azurerm_kubernetes_cluster_node_pool" "clusteruserpool" {
  for_each = var.aks_userpool
  name = each.value.userpoolname

  kubernetes_cluster_id = data.azurerm_kubernetes_cluster.cluster.id

  vm_size = each.value.userpoolvm_size

  node_count = each.value.usernodecount
  vnet_subnet_id = data.azurerm_subnet.aksbnet[each.key].id

  mode = "User"

  tags = {

    Environment = each.value.enviroment_name
  }
}