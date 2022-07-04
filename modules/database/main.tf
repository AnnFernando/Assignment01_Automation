resource "azurerm_postgresql_server" "postgres_server" {
  name                         = var.postgres_server
  location                     = var.location
  resource_group_name          = var.res_group

  sku_name                     = "B_Gen5_2"

  storage_mb                   = 5120
  geo_redundant_backup_enabled = false
  version                      = "11"

  administrator_login                = "psqladmin"
  administrator_login_password       = "H@Sh1CoR3!"
  ssl_enforcement_enabled            = true
  tags                               = local.common_tags
}

resource "azurerm_postgresql_database" "postgresdb" {
  name                = var.postgresdb
  resource_group_name = var.res_group
  server_name         = azurerm_postgresql_server.postgres_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}