variable "project_id" {
  description = "The project ID to apply the policies to"
  type        = string
}

variable "automatic_iam_grants" {
  description = "Disable Automatic IAM Grants for Default Service Accounts"
  type        = bool
  default     = true
}
