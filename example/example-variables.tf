variable "location" {
  description = "value of the location"
  
}

variable "resource_group_name" {
  description = "value of the resource group name"
}

variable "dns_servers" {
  description = "value of the dns servers"
}

variable "address_space" {
  description = "value of the address space"
}

variable "diag_object" {
  description = "contains the logs and metrics for diagnostics"
  type = object({
    log_analytics_workspace_id = string
    log                        = list(tuple([string, bool, bool, number]))
    metric                     = list(tuple([string, bool, bool, number]))
  })
  default = null
}

  
variable "create_nsg" {
  description = "create network security group"
  type        = bool
  default     = true
}
  