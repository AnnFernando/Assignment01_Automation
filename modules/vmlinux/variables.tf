variable "res_group"{
    default = "7411_assignment1_RG"
}
variable "location"{
    default = "centralus"
}
variable "watcher_extension"{
  default = "network-watcher"
}
variable "storage_acc_uri"{
  default = ""
}
variable "linux_name" {
  default = "lab04s1-db1-u-vm"
}
variable "linux_size" {
  default = "Standard_B1s"
}
variable "adminuser" {
  default = "ann-n01517411"
}
variable "adminpwd" {
  default = "Admin123"
}
variable "linux_os_disk" {
  type = map(string)
  default = {
    lod_os_account_type = "Standard_LRS"
    lod_disk_size       = "127"
    lod_caching         = "ReadWrite"
  }
}
variable "linux_os_info" {
  type = map(string)
  default = {
    loi_os_publisher = "OpenLogic"
    loi_offer        = "CentOS"
    loi_sku          = 7.3
    loi_version      = "latest"
  }
}
variable "linux_avs" {
  default = "linux_avs"
}
variable "nb_count" {
  default = 2
}
variable "priv_key" {
  default = "~/.ssh/id_rsa"
}
variable "pub_key" {
  default = "~/.ssh/id_rsa.pub"
}
variable "subnet_id"{
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