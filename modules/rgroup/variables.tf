variable "res_group" {
  default = "7411-assignment1-RG"
}
variable "location" {
  default = "centralus"
}
locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Ann.Fernando"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}