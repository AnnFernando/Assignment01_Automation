output "Windows_Id"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].id
}
output "Windows_Name"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].computer_name
}
output "Windows-VM_DNS_Label"{
    value = values(azurerm_public_ip.public_ip)[*].fqdn
}
output "Windows-Private_IP_Address"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].private_ip_address
}
output "Windows-Public_IP_Address"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].public_ip_address
}
output "Windows_Availability_Set"{
    value = azurerm_availability_set.avset.name
}