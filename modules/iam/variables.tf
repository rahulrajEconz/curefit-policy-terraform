variable "organization_id" {
  description = "The organization ID to apply the policies to"
  type        = string
}

variable "disable_service_account_creation" {
  description = "Disable service account creation"
  type        = bool
  default     = true
}

variable "disable_service_account_key_creation" {
  description = "Disable service account key creation"
  type        = bool
  default     = true
}

variable "disable_service_account_key_upload" {
  description = "Disable service account key upload"
  type        = bool
  default     = true
}

variable "allowed_policy_member_domains" {
  description = "List of allowed domains for policy members"
  type        = list(string)
  default     = []
}

variable "allow_sa_credential_lifetime_extension" {
  description = "List of service accounts allowed to extend credential lifetime"
  type        = list(string)
  default     = []
}
