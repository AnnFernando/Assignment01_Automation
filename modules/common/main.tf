
resource "azurerm_log_analytics_workspace" "log_analytics_ws" {
  name                = var.log_analytics_ws
  location            = var.location
  resource_group_name = var.res_group
  sku                 = var.sku_log
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "rec_service_vault" {
  name                = var.rec_service_vault
  location            = var.location
  resource_group_name = var.res_group
  sku                 = var.sku
  tags                = local.common_tags
  depends_on          = [var.res_group]
}
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account
  resource_group_name      = var.res_group
  location                 = var.location
  account_tier             = var.tier_type
  account_replication_type = var.replication_type
  tags                     = local.common_tags
  depends_on               = [var.res_group]
}

resource "azurerm_storage_container" "storage_container" {
  name                    = var.container_name
  storage_account_name    = azurerm_storage_account.storage_account.name
  container_access_type   = var.container_access_type
}

resource "azurerm_storage_blob" "blob_storage" {
  name                    = var.blob_name
  storage_account_name    = azurerm_storage_account.storage_account.name
  storage_container_name  = azurerm_storage_container.storage_container.name
  type                    = var.blob_type
}