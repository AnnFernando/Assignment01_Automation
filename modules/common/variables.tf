variable "log_analytics_ws"{
    default = "7411loganalws"
}
variable "sku"{
    default = "Standard"
}
variable "sku_log"{
    default = "PerGB2018"
}
variable "res_group"{
    default = "7411_assignment1_RG"
}
variable "location"{
    default = "centralus"
}
variable "rec_service_vault"{
    default = "recsvault7411"
}
variable "storage_account"{
    default = "7411storageaccount"
}
variable "tier_type"{
    default = "Standard"
}
variable "replication_type"{
    default = "LRS"
}
variable "container_name"{
    default = "7411blobcontainer"
}
variable "container_access_type"{
    default = "private"
}
variable "blob_type" {
    default = "Block"
}
variable "blob_name"{
    default = "7411blobstorage"
}
locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Ann.Fernando"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}