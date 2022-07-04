variable "res_group"{
    default = "7411_assignment1_RG"
}
variable "location"{
    default = "centralus"
}
variable "vnet" {
  default = "network-vnet"
}
variable "vnet_space" {
  default = ["10.0.0.0/16"]
}
variable "subnet" {
  default = "network-subnet"
}
variable "subnet_space" {
  default = ["10.0.1.0/24"]
}
variable "secgroup" {
  default = "network-nsg"
}
locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Ann.Fernando"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}