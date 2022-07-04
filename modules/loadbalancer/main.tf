resource "azurerm_lb" "load_balancer" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.res_group
  tags                = local.common_tags

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
    subnet_id            = var.subnet_id
  }
}

resource "azurerm_lb_nat_rule" "nat_rule1" {
  resource_group_name            = var.res_group
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "http1"
  protocol                       = "Tcp"
  frontend_port                  = 4550
  backend_port                   = 4550
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_nat_rule" "nat_rule2" {
  resource_group_name            = var.res_group
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "http2"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_network_interface_nat_rule_association" "rule_association1" {
  network_interface_id   = var.linux_network_int_id_1
  ip_configuration_name  = var.linux_ip_config_1
  nat_rule_id            = azurerm_lb_nat_rule.nat_rule1.id
}

resource "azurerm_network_interface_nat_rule_association" "rule_association2" {
  network_interface_id   = var.linux_network_int_id_2
  ip_configuration_name  = var.linux_ip_config_2
  nat_rule_id            = azurerm_lb_nat_rule.nat_rule2.id
}