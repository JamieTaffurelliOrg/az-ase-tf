# az-ase-tf

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.20 |
| <a name="provider_azurerm.logs"></a> [azurerm.logs](#provider\_azurerm.logs) | ~> 3.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_environment_v3.ase](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_environment_v3) | resource |
| [azurerm_monitor_diagnostic_setting.acr_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.ase_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_service_plan.service_plans](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_subnet.ase_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_new_private_endpoint_connections"></a> [allow\_new\_private\_endpoint\_connections](#input\_allow\_new\_private\_endpoint\_connections) | Allow private endpoint connections | `bool` | `true` | no |
| <a name="input_app_service_environment_name"></a> [app\_service\_environment\_name](#input\_app\_service\_environment\_name) | Name of the App Service Environment | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Name of Log Analytics Workspace to send diagnostics | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | Resource Group of Log Analytics Workspace to send diagnostics | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group to deploy to | `string` | n/a | yes |
| <a name="input_service_plans"></a> [service\_plans](#input\_service\_plans) | App service plans to deploy | <pre>list(object(<br>    {<br>      name                     = string<br>      os_type                  = optional(string, "Linux")<br>      sku_name                 = string<br>      worker_count             = number<br>      per_site_scaling_enabled = optional(bool, false)<br>      zone_balancing_enabled   = optional(bool, true)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet to deploy to | <pre>object(<br>    {<br>      name                 = string<br>      virtual_network_name = string<br>      resource_group_name  = string<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply | `map(string)` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Enable zone redundancy | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
