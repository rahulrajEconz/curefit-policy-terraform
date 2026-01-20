resource "google_org_policy_policy" "public_access_prevention" {
  name   = "projects/${var.project_id}/policies/storage.publicAccessPrevention"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.enforce_public_access_prevention ? "TRUE" : "FALSE"
    }
  }
}


resource "google_org_policy_policy" "uniform_bucket_level_access" {
  name   = "projects/${var.project_id}/policies/storage.uniformBucketLevelAccess"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.enforce_uniform_bucket_level_access ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "retention_policy_duration" {
  count  = length(var.retention_policy_durations) > 0 ? 1 : 0
  name   = "projects/${var.project_id}/policies/storage.retentionPolicySeconds"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      values {
        allowed_values = var.retention_policy_durations
      }
    }
  }
}
