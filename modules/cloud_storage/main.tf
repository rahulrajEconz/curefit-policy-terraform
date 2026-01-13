resource "google_organization_policy" "public_access_prevention" {
  org_id     = var.organization_id
  constraint = "constraints/storage.publicAccessPrevention"

  boolean_policy {
    enforced = var.enforce_public_access_prevention
  }
}

resource "google_organization_policy" "uniform_bucket_level_access" {
  org_id     = var.organization_id
  constraint = "constraints/storage.uniformBucketLevelAccess"

  boolean_policy {
    enforced = var.enforce_uniform_bucket_level_access
  }
}

resource "google_organization_policy" "retention_policy_duration" {
  count      = length(var.retention_policy_durations) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/storage.retentionPolicySeconds"

  list_policy {
    allow {
      values = var.retention_policy_durations
    }
  }
}
