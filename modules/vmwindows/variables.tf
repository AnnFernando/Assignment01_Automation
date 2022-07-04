variable "res_group"{
    default = "7411_assignment1_RG"
}
variable "location"{
    default = "centralus"
}
variable "storage_acc_uri"{
  default = ""
}
variable "windows_name"{
    default = {
        lab-web-w-vm1 = "Standard_B1s"
        lab-web-w-vm2 = "Standard_B1ms"
    }
}
variable "adminuser"{
    default = "ann-n01517411"
}
variable "adminpwd"{
    default = "Admin123"
}
variable "windows_os_disk"{
   type = map(string)
   default = {
       wod_os_account_type = "Standard_LRS"
       wod_disk_size       = "127"
       wod_caching         = "ReadWrite"
   }
}
variable "windows_os_info"{
    type = map(string)
    default = {
      woi_os_publisher = "MicrosoftWindowsServer"
      woi_offer        = "WindowsServer"
      woi_sku          = "2016-Datacenter"
      woi_version      = "latest"  
   }
}
variable "windows_avs"{
    default = "windows_avs"
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