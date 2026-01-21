# Boolean Constraints
variable "disable_service_account_creation" {
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

variable "disable_service_account_key_creation" {
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

variable "disable_service_account_key_upload" {
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
variable "allowed_policy_member_domains" {
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

variable "allow_sa_credential_lifetime_extension" {
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
