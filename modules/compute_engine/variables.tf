# Boolean Constraints
variable "disable_internet_network_endpoint_groups" {
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
}

variable "disable_nested_virtualization" {
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
}

variable "disable_serial_port_access" {
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
}

variable "disable_serial_port_logging" {
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
}

variable "require_os_login" {
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
}

variable "require_shielded_vm" {
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
}

variable "skip_default_network_creation" {
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
}

# List Constraints
variable "trusted_image_projects" {
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
}

variable "vm_can_ip_forward" {
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
}

variable "vm_external_ip_access" {
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
}
