resource "azurerm_availability_set" "avset"{
  name                         = var.windows_avs
  resource_group_name          = var.res_group
  location                     = var.location
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  resource_group_name = var.res_group
  location            = var.location
  tags                = local.common_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.res_group
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-dns"
  tags                = local.common_tags
  depends_on          = [var.res_group]
}

resource "azurerm_windows_virtual_machine" "windows_vm"{
  for_each                        = var.windows_name
  name                            = each.key
  resource_group_name             = var.res_group
  location                        = var.location
  size                            = each.value
  computer_name                   = each.key
  admin_username                  = var.adminuser
  admin_password                  = var.adminpwd
  network_interface_ids           = [azurerm_network_interface.windows_nic[each.key].id]
  tags                            = local.common_tags
  availability_set_id             = azurerm_availability_set.avset.id
  depends_on                      = [azurerm_availability_set.avset]

  os_disk{
    name                 = "${each.key}-os-disk"
    caching              = var.windows_os_disk["wod_caching"]
    storage_account_type = var.windows_os_disk["wod_os_account_type"]
    disk_size_gb         = var.windows_os_disk["wod_disk_size"]
  }

  source_image_reference{
    publisher = var.windows_os_info["woi_os_publisher"]
    offer     = var.windows_os_info["woi_offer"]
    sku       = var.windows_os_info["woi_sku"]
    version   = var.windows_os_info["woi_version"]
  }

  winrm_listener{
    protocol = "Http"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_acc_uri
  }
} 

resource "azurerm_virtual_machine_extension" "avext" {
  for_each               = var.windows_name
  name                   = "IaaSAntimalware"
  virtual_machine_id     = "${azurerm_windows_virtual_machine.windows_vm[each.key].id}"
  publisher              = "Microsoft.Azure.Security"
  type                   = "IaaSAntimalware"
  type_handler_version   = "1.3"
  auto_upgrade_minor_version = "true"
}