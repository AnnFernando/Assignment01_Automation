module "rgroup" {
  source           = "./modules/rgroup"
  res_group        = "7411_assignment1_RG"
  location         = "australia east"
}

module "network" {
  vnet                = "vnet7411"
  source              = "./modules/network"
  res_group           = module.rgroup.res_group.name
  location            = module.rgroup.res_group.location
  vnet_space          = ["10.0.0.0/16"]
  subnet              = "subnet"
  subnet_space        = ["10.0.1.0/24"]
  secgroup            = "secgroup"
  depends_on          = [module.rgroup]
}

module "common" {
  source             = "./modules/common"
  log_analytics_ws   = "loganal7411ws"
  res_group          = module.rgroup.res_group.name
  location           = module.rgroup.res_group.location
  sku                = "Standard"
  sku_log            = "PerGB2018"
  rec_service_vault  = "recsvault7411"
  storage_account    = "7411storageaccount"
  tier_type          = "Standard"
  replication_type   = "LRS"
  depends_on         = [module.rgroup]
}

module "vmlinux"{
  source              = "./modules/vmlinux"
  res_group           = module.rgroup.res_group.name
  location            = module.rgroup.res_group.location
  linux_name          = "linux-vm7411"
  linux_avs           = "linux-avs7411"
  nb_count            = 2
  subnet_id           = module.network.subnet_id
  watcher_extension   = "networkwatcher7411"
  storage_acc_uri     = module.common.storage_account.primary_blob_endpoint
  depends_on          = [module.rgroup, module.network, module.common]
} 

module "vmwindows"{
  source              = "./modules/vmwindows"
  res_group           = module.rgroup.res_group.name
  location            = module.rgroup.res_group.location
  windows_name        = {
    w-vm-7411      = "Standard_B1ms"
  }
  windows_avs         = "windows-avs"
  subnet_id           = module.network.subnet_id
  storage_acc_uri     = module.common.storage_account.primary_blob_endpoint
  depends_on          = [module.rgroup, module.network, module.common]
}

module "datadisk" {
  source              = "./modules/datadisk"
  res_group           = module.rgroup.res_group.name
  location            = module.rgroup.res_group.location
  dd_count            = 3
  vm_name             = {
    vm1 = "${module.vmlinux.linux_ids[0]}", vm2 = "${module.vmlinux.linux_ids[1]}", vm3 = "${module.vmwindows.Windows_Id[0]}"
  }
  depends_on          = [module.rgroup, module.vmlinux, module.vmwindows]
}

module "loadbalancer" {
  source                 = "./modules/loadbalancer"
  res_group              = module.rgroup.res_group.name
  location               = module.rgroup.res_group.location
  load_balancer_name     = "load-balancer-7411"
  subnet_id              = module.network.subnet_id
  linux_network_int_id_1 = module.vmlinux.linux_int_id_1
  linux_network_int_id_2 = module.vmlinux.linux_int_id_2
  linux_ip_config_1      = module.vmlinux.linux_ip_config_1
  linux_ip_config_2      = module.vmlinux.linux_ip_config_2
  depends_on             = [module.rgroup, module.vmlinux]
}

module "database" {
  source                 = "./modules/database"
  res_group              = module.rgroup.res_group.name
  location               = module.rgroup.res_group.location
  postgres_server        = "postgserver"
  postgresdb             = "postgres_db7411"
  depends_on             = [module.rgroup]
}