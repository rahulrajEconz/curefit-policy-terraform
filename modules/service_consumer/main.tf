resource "google_org_policy_policy" "automatic_iam_grants" {
  for_each = toset(var.automatic_iam_grants.project_ids)
  name     = "projects/${each.value}/policies/iam.automaticIamGrantsForDefaultServiceAccounts"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.automatic_iam_grants.rules
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
