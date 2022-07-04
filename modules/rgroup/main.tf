resource "azurerm_resource_group" "rgroup" {
  name     = var.res_group
  location = var.location
  tags     = local.common_tags
}