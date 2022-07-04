output "linux_ids" {
  value = azurerm_linux_virtual_machine.linux_vm[*].id
}
output "linux_int_id_1" {
  value = azurerm_network_interface.linux_nic[0].id
}
output "linux_int_id_2" {
  value = azurerm_network_interface.linux_nic[1].id
}
output "linux_ip_config_1" {
  value = azurerm_network_interface.linux_nic[0].ip_configuration[0].name
}
output "linux_ip_config_2" {
  value = azurerm_network_interface.linux_nic[1].ip_configuration[0].name
}
output "computer_names" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}
output "vm_dns_labels" {
  value = azurerm_public_ip.public_ip[*].fqdn
}
output "private_ip_address" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}
output "avset" {
  value = azurerm_availability_set.avset.name
}
output "watcher_extension"{
  value = azurerm_virtual_machine_extension.watcher_extension[*].name
}
