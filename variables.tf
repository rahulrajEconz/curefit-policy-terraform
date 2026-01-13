variable "organization_id" {
  description = "The organization ID to apply the policies to"
  type        = string
}

# GCP Core
variable "allowed_resource_locations" {
  description = "List of allowed locations for resources"
  type        = list(string)
  default     = []
}

# Cloud Storage
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

# Compute Engine
variable "disable_internet_network_endpoint_groups" {
  description = "Disable Internet Network Endpoint Groups"
  type        = bool
  default     = true
}

variable "disable_nested_virtualization" {
  description = "Disable VM nested virtualization"
  type        = bool
  default     = true
}

variable "disable_serial_port_access" {
  description = "Disable VM serial port access"
  type        = bool
  default     = true
}

variable "disable_serial_port_logging" {
  description = "Disable VM serial port logging to Stackdriver"
  type        = bool
  default     = true
}

variable "require_os_login" {
  description = "Require OS Login"
  type        = bool
  default     = true
}

variable "require_shielded_vm" {
  description = "Require Shielded VMs"
  type        = bool
  default     = true
}

variable "skip_default_network_creation" {
  description = "Skip default network creation"
  type        = bool
  default     = true
}

variable "trusted_image_projects" {
  description = "List of trusted image projects"
  type        = list(string)
  default     = []
}

variable "vm_can_ip_forward" {
  description = "List of VMs allowed to enable IP forwarding"
  type        = list(string)
  default     = []
}

variable "vm_external_ip_access" {
  description = "List of allowed external IPs for VM instances"
  type        = list(string)
  default     = []
}

# IAM
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

# Resource Manager
variable "restrict_xpn_project_lien_removal" {
  description = "Restrict shared VPC project lien removal"
  type        = bool
  default     = true
}

# Service Consumer
variable "automatic_iam_grants" {
  description = "Disable Automatic IAM Grants for Default Service Accounts"
  type        = bool
  default     = true
}
