output "resource_group" {
  value = module.rgroup
}
output "log_analytics_workspace"{
    value = module.common.log_analytics_ws
}
output "recovery_services_vault"{
    value = module.common.rec_service_vault
}
output "standard_storage_account"{
    value = module.common.storage_account.name
}
output "VirtualNetwork" {
  value = module.network.vnet
}
output "Subnet" {
  value = module.network.subnet
}
output  "SecurityGroup" {
  value = module.network.secgroup
}
output "Linux-VM_Hostnames" {
  value = module.vmlinux.computer_names
}
output "Linux-VM_DNS_Labels" {
  value = module.vmlinux.vm_dns_labels
}
output "Linux-Private_IP_Addresses" {
  value = module.vmlinux.private_ip_address
}
output "Linux-Public_IP_Addresses" {
  value = module.vmlinux.public_ip_address
}
output "Linux_Availability_Set" {
  value = module.vmlinux.avset
}
output "Network_Watcher_Extension"{
  value = module.vmlinux.watcher_extension
}
output "windows_Name"{
  value = module.vmwindows.Windows_Name
}
output "Windows-VM_DNS_Label"{
  value = module.vmwindows.Windows-VM_DNS_Label
}
output "Windows-Private_IP_Address"{
  value = module.vmwindows.Windows-Private_IP_Address
}
output "Windows-Public_IP_Address"{
  value = module.vmwindows.Windows-Public_IP_Address
}
output "Windows_Availability_Set"{
  value = module.vmwindows.Windows_Availability_Set
}
output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name
}
output "postgres_db_name" {
  value = module.database.postgresdb_name
}