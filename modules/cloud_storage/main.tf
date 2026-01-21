resource "google_org_policy_policy" "public_access_prevention" {
  for_each = toset(var.enforce_public_access_prevention.project_ids)
  name     = "projects/${each.value}/policies/storage.publicAccessPrevention"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.enforce_public_access_prevention.rules
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
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "uniform_bucket_level_access" {
  for_each = toset(var.enforce_uniform_bucket_level_access.project_ids)
  name     = "projects/${each.value}/policies/storage.uniformBucketLevelAccess"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.enforce_uniform_bucket_level_access.rules
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
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "retention_policy_duration" {
  for_each = toset(var.retention_policy_durations.project_ids)
  name     = "projects/${each.value}/policies/storage.retentionPolicySeconds"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.retention_policy_durations.rules
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
