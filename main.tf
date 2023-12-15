resource "azurerm_app_service_environment_v3" "ase" {
  name                                   = var.app_service_environment_name
  resource_group_name                    = var.resource_group_name
  subnet_id                              = data.azurerm_subnet.ase_subnet.id
  allow_new_private_endpoint_connections = var.allow_new_private_endpoint_connections
  zone_redundant                         = var.zone_redundant
  internal_load_balancing_mode           = "Web, Publishing"

  cluster_setting {
    name  = "DisableTls1.0"
    value = "1"
  }

  cluster_setting {
    name  = "InternalEncryption"
    value = "true"
  }

  cluster_setting {
    name  = "FrontEndSSLCipherSuiteOrder"
    value = "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
  }

  tags = var.tags

  lifecycle {

    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_diagnostic_setting" "ase_diagnostics" {
  name                       = "${var.log_analytics_workspace_name}-security-logging"
  target_resource_id         = azurerm_app_service_environment_v3.ase.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logs.id

  enabled_log {
    category = "AppServiceEnvironmentPlatformLogs"
  }
}

resource "azurerm_service_plan" "service_plans" {
  #checkov:skip=CKV_AZURE_225:Zone redundancy will not be required in all envs
  for_each                   = { for k in var.service_plans : k.name => k if k != null }
  name                       = each.key
  resource_group_name        = var.resource_group_name
  location                   = azurerm_app_service_environment_v3.ase.location
  app_service_environment_id = azurerm_app_service_environment_v3.ase.id
  os_type                    = each.value["os_type"]
  sku_name                   = each.value["sku_name"]
  worker_count               = each.value["worker_count"]
  per_site_scaling_enabled   = each.value["per_site_scaling_enabled"]
  zone_balancing_enabled     = each.value["zone_balancing_enabled"]
  tags                       = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "acr_diagnostics" {
  for_each                   = { for k in var.service_plans : k.name => k if k != null }
  name                       = "${var.log_analytics_workspace_name}-security-logging"
  target_resource_id         = azurerm_service_plan.service_plans[(each.key)].id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logs.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
