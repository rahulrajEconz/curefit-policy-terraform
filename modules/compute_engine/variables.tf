variable "organization_id" {
  description = "The organization ID to apply the policies to"
  type        = string
}

# Boolean Constraints
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

# List Constraints
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
