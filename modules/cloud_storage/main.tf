<<<<<<< HEAD
/* By default enabled
resource "google_org_policy_policy" "public_access_prevention" {
  name   = "organizations/${var.organization_id}/policies/storage.publicAccessPrevention"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.enforce_public_access_prevention ? "TRUE" : "FALSE"
    }
=======
resource "google_organization_policy" "public_access_prevention" {
  org_id     = var.organization_id
  constraint = "constraints/storage.publicAccessPrevention"

  boolean_policy {
    enforced = var.enforce_public_access_prevention
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}
*/

resource "google_organization_policy" "uniform_bucket_level_access" {
  org_id     = var.organization_id
  constraint = "constraints/storage.uniformBucketLevelAccess"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.enforce_uniform_bucket_level_access ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.enforce_uniform_bucket_level_access
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "retention_policy_duration" {
  count      = length(var.retention_policy_durations) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/storage.retentionPolicySeconds"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      values {
        allowed_values = var.retention_policy_durations
      }
=======
  list_policy {
    allow {
      values = var.retention_policy_durations
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}
