variable "allowed_resource_locations" {
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
