variable "project_id" {
  description = "The project ID to apply the policies to"
  type        = string
}

variable "enforce_public_access_prevention" {
  description = "Enforce public access prevention on Cloud Storage buckets"
  type        = bool
  default     = true
}

variable "enforce_uniform_bucket_level_access" {
  description = "Enforce uniform bucket-level access on Cloud Storage buckets"
  type        = bool
  default     = true
}

variable "retention_policy_durations" {
  description = "List of allowed retention policy durations (in seconds)"
  type        = list(string)
  default     = []
}
