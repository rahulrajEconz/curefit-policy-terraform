/* By default enabled
resource "google_org_policy_policy" "public_access_prevention" {
  name   = "organizations/${var.organization_id}/policies/storage.publicAccessPrevention"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.enforce_public_access_prevention ? "TRUE" : "FALSE"
    }
  }
}
*/

resource "google_org_policy_policy" "uniform_bucket_level_access" {
  name   = "organizations/${var.organization_id}/policies/storage.uniformBucketLevelAccess"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.enforce_uniform_bucket_level_access ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "retention_policy_duration" {
  count  = length(var.retention_policy_durations) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/storage.retentionPolicySeconds"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.retention_policy_durations
      }
    }
  }
}
