variable "organization_id" {
  description = "The organization ID to apply the policies to"
  type        = string
}

variable "automatic_iam_grants" {
  description = "Disable Automatic IAM Grants for Default Service Accounts"
  type        = bool
  default     = true
}
