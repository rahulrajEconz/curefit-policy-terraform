variable "enforce_public_access_prevention" {
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

variable "enforce_uniform_bucket_level_access" {
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

variable "retention_policy_durations" {
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
