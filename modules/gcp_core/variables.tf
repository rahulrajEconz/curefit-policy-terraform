variable "organization_id" {
  description = "The organization ID to apply the policies to"
  type        = string
}

variable "allowed_resource_locations" {
  description = "List of allowed locations for resources"
  type        = list(string)
  default     = []
}
