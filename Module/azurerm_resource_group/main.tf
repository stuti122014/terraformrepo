resource "azurerm_resource_group" "aks_rg" {
    for_each = var.AKS_rg
    name= each.value.resource_group_name
    location = each.value.location
  
}