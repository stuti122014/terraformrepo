# data "azurerm_subnet" "appgw" {
#   name                 = "appgw-subnet"
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   resource_group_name  = each.value.resource_group_name
# }