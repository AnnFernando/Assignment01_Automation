variable "res_group"{
    default = "7411_assignment1_RG"
}
variable "location"{
    default = "centralus"
}
variable "postgres_server"{
    default = "postgserver"
}
variable "postgresdb"{
    default = "postgresdb7411"
}
locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Ann.Fernando"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}