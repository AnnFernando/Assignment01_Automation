resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.res_group
  address_space       = var.vnet_space
  tags                = local.common_tags
  depends_on          = [var.res_group]
}
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.res_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_space
  depends_on           = [var.res_group, azurerm_virtual_network.vnet]
}
resource "azurerm_network_security_group" "secgroup" {
  name                = var.secgroup
  location            = var.location
  resource_group_name = var.res_group
  tags                = local.common_tags
  depends_on          = [azurerm_virtual_network.vnet]

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "sgassociation" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.secgroup.id
}
