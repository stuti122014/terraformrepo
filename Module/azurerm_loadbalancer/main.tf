resource "azurerm_public_ip" "pip" {

  for_each = var.load_balancers

  name                = "${each.value.name}-pip"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}


resource "azurerm_lb" "lb" {

  for_each = var.load_balancers

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku = "Standard"

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}