output "vnet" {
  value = azurerm_virtual_network.vnet.name
}
output "vnet_space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "subnet" {
  value = azurerm_subnet.subnet.name
}
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "subnet_space" {
  value = azurerm_subnet.subnet.address_prefixes
}
output  "secgroup" {
  value = azurerm_network_security_group.secgroup.name
}

