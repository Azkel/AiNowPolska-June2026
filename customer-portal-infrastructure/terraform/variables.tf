variable "environment" {
  description = "Environment short name: dev, tst, acc, prod"
  type        = string
}

variable "location" {
  description = "Azure region key"
  type        = string
  default     = "westeurope"
}

variable "subscription_id" {
  description = "Target subscription (set via pipeline or tfvars, not committed)"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
