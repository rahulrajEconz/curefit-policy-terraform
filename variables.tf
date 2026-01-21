# General Variables
variable "project_ids" {
  description = "Global default project IDs (optional)"
  type        = list(string)
  default     = []
}

# GCP Core
variable "allowed_resource_locations" {
  description = "Allowed locations for resources"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {}) # Default to empty map
      tag_ids        = optional(map(string), {}) # Default to empty map
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

# Cloud Storage
variable "enforce_public_access_prevention" {
  description = "Enforce public access prevention on Cloud Storage buckets"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "enforce_uniform_bucket_level_access" {
  description = "Enforce uniform bucket-level access on Cloud Storage buckets"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "retention_policy_durations" {
  description = "Allowed retention policy durations (in seconds)"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {})
      tag_ids        = optional(map(string), {})
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

# Compute Engine
variable "disable_internet_network_endpoint_groups" {
  description = "Disable Internet Network Endpoint Groups"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "disable_nested_virtualization" {
  description = "Disable VM nested virtualization"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "disable_serial_port_access" {
  description = "Disable VM serial port access"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "disable_serial_port_logging" {
  description = "Disable VM serial port logging to Stackdriver"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "require_os_login" {
  description = "Require OS Login"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "require_shielded_vm" {
  description = "Require Shielded VMs"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "skip_default_network_creation" {
  description = "Skip default network creation"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "trusted_image_projects" {
  description = "Trusted image projects"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {})
      tag_ids        = optional(map(string), {})
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

variable "vm_can_ip_forward" {
  description = "VMs allowed to enable IP forwarding"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {})
      tag_ids        = optional(map(string), {})
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

variable "vm_external_ip_access" {
  description = "Allowed external IPs for VM instances"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {})
      tag_ids        = optional(map(string), {})
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

# IAM
variable "disable_service_account_creation" {
  description = "Disable service account creation"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "disable_service_account_key_creation" {
  description = "Disable service account key creation"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "disable_service_account_key_upload" {
  description = "Disable service account key upload"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

variable "allowed_policy_member_domains" {
  description = "Allowed domains for policy members"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {})
      tag_ids        = optional(map(string), {})
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

variable "allow_sa_credential_lifetime_extension" {
  description = "Service accounts allowed to extend credential lifetime"
  type = object({
    project_ids = list(string)
    rules = list(object({
      allowed_values = optional(list(string))
      denied_values  = optional(list(string))
      tags           = optional(map(string), {})
      tag_ids        = optional(map(string), {})
      title          = optional(string)
      description    = optional(string)
    }))
  })
  default = { project_ids = [], rules = [] }
}

# Resource Manager
variable "restrict_xpn_project_lien_removal" {
  description = "Restrict shared VPC project lien removal"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}

# Service Consumer
variable "automatic_iam_grants" {
  description = "Disable Automatic IAM Grants for Default Service Accounts"
  type = object({
    project_ids = list(string)
    rules = list(object({
      enforce     = optional(bool)
      tags        = optional(map(string), {})
      tag_ids     = optional(map(string), {})
      title       = optional(string)
      description = optional(string)
    }))
  })
  default = { project_ids = [], rules = [{ enforce = true }] }
}
