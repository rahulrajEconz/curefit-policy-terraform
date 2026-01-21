resource "google_org_policy_policy" "resource_location_restriction" {
  for_each = toset(var.allowed_resource_locations.project_ids)
  name     = "projects/${each.value}/policies/gcp.resourceLocations"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.allowed_resource_locations.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        dynamic "values" {
          for_each = (rules.value.allowed_values != null || rules.value.denied_values != null) ? [1] : []
          content {
            allowed_values = rules.value.allowed_values
            denied_values  = rules.value.denied_values
          }
        }
      }
    }
  }
}
