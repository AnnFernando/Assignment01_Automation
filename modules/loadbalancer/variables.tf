variable "res_group" {
    default = "7411_assignment1_RG"
}
variable "location" {
    default = "centralus"
}
variable "load_balancer_name" {
    default = "load_balancer_7411"
}
variable "public_ip_id" {
    default = ""
}
variable "subnet_id" {
    default = ""
}
variable "linux_network_int_id_1"{
    default = ""
}
variable "linux_network_int_id_2"{
    default = ""
}
variable "linux_ip_config_1"{
    default = ""
}
variable "linux_ip_config_2"{
    default = ""
}
locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Ann.Fernando"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}
