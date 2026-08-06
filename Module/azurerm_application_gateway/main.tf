data "azurerm_subnet" "appgw" {
  for_each = var.app_gw

  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_public_ip" "appgw_pip" {
  for_each = var.app_gw

  name                = "${each.value.name}-pip"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_application_gateway" "appgway" {
  for_each = var.app_gw

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = data.azurerm_subnet.appgw[each.key].id
  }

  frontend_ip_configuration {
    name                 = "frontend-public-ip"
    public_ip_address_id = azurerm_public_ip.appgw_pip[each.key].id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  backend_address_pool {
    name = "backend-pool"
  }

  probe {
    name                = "health-probe"
    protocol            = "Http"
    path                = "/"
    interval            = 30
    timeout             = 30
    unhealthy_threshold = 3
    host                = "127.0.0.1"
  }

  backend_http_settings {
    name                  = "backend-settings"
    port                  = 80
    protocol              = "Http"
    cookie_based_affinity = "Disabled"
    request_timeout       = 30
    probe_name            = "health-probe"
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend-public-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-settings"
    priority                   = 100
  }
}