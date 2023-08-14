variable "location" {
  
}

variable "resource_group_name" {
  
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

variable "subnet_name" {
  
}
  
variable "create_nsg" {
  description = "create network security group"
  type        = bool
  default     = true
}
  