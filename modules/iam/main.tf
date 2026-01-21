resource "google_org_policy_policy" "disable_sa_creation" {
  for_each = toset(var.disable_service_account_creation.project_ids)
  name     = "projects/${each.value}/policies/iam.disableServiceAccountCreation"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_service_account_creation.rules
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

resource "google_org_policy_policy" "disable_sa_key_creation" {
  for_each = toset(var.disable_service_account_key_creation.project_ids)
  name     = "projects/${each.value}/policies/iam.disableServiceAccountKeyCreation"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_service_account_key_creation.rules
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

resource "google_org_policy_policy" "disable_sa_key_upload" {
  for_each = toset(var.disable_service_account_key_upload.project_ids)
  name     = "projects/${each.value}/policies/iam.disableServiceAccountKeyUpload"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_service_account_key_upload.rules
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

resource "google_org_policy_policy" "allowed_policy_member_domains" {
  for_each = toset(var.allowed_policy_member_domains.project_ids)
  name     = "projects/${each.value}/policies/iam.allowedPolicyMemberDomains"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.allowed_policy_member_domains.rules
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

resource "google_org_policy_policy" "allow_sa_credential_lifetime_extension" {
  for_each = toset(var.allow_sa_credential_lifetime_extension.project_ids)
  name     = "projects/${each.value}/policies/iam.allowServiceAccountCredentialLifetimeExtension"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.allow_sa_credential_lifetime_extension.rules
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
