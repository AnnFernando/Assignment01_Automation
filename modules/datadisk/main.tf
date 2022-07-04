resource "azurerm_managed_disk" "datadisk" {
  for_each             = var.vm_name
  name                 = "${each.key}-data-disk"
  location             = var.location
  resource_group_name  = var.res_group
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "attachdisk" {
  for_each           = var.vm_name
  managed_disk_id    = "${azurerm_managed_disk.datadisk[each.key].id}"
  virtual_machine_id = "${each.value}"
  lun                = "10"
  caching            = "ReadWrite"
}