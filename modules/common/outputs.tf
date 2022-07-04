output "log_analytics_ws"{
    value = azurerm_log_analytics_workspace.log_analytics_ws.name
}
output "sku"{
    value = azurerm_log_analytics_workspace.log_analytics_ws.sku
}
output "rec_service_vault"{
    value = azurerm_recovery_services_vault.rec_service_vault.name
}
output "storage_account"{
    value = azurerm_storage_account.storage_account
}