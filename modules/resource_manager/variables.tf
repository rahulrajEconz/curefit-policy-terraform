variable "restrict_xpn_project_lien_removal" {
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
