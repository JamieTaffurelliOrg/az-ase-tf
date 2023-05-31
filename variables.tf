variable "app_service_environment_name" {
  type        = string
  description = "Name of the App Service Environment"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group to deploy to"
}

variable "allow_new_private_endpoint_connections" {
  type        = bool
  default     = true
  description = "Allow private endpoint connections"
}

variable "zone_redundant" {
  type        = bool
  default     = true
  description = "Enable zone redundancy"
}

variable "subnet" {
  type = object(
    {
      name                 = string
      virtual_network_name = string
      resource_group_name  = string
    }
  )
  description = "Subnet to deploy to"
}

variable "service_plans" {
  type = list(object(
    {
      name                     = string
      os_type                  = optional(string, "Linux")
      sku_name                 = string
      worker_count             = number
      per_site_scaling_enabled = optional(bool, false)
      zone_balancing_enabled   = optional(bool, true)
    }
  ))
  default     = []
  description = "App service plans to deploy"
}


variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of Log Analytics Workspace to send diagnostics"
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "Resource Group of Log Analytics Workspace to send diagnostics"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}
