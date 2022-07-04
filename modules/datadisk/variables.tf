variable "res_group"{
    default = "7411_assignment1_RG"
}
variable "location"{
    default = "centralus"
}
variable "dd_count"{
  default = 3
}
variable "vm_name"{
  default = "vm_name"
}
locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Ann.Fernando"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}