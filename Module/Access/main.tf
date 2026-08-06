resource "azurerm_role_assignment" "agic" {
  scope                = data.azurerm_application_gateway.apgw1.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_kubernetes_cluster.aks11.identity[0].principal_id

}
resource "azurerm_role_assignment" "agic_appgw" {

  scope = data.azurerm_application_gateway.apgw1.id

  role_definition_name = "Contributor"

  principal_id = data.azurerm_kubernetes_cluster.aks11.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}