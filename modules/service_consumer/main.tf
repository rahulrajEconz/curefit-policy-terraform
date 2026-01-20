resource "google_org_policy_policy" "automatic_iam_grants" {
  name   = "projects/${var.project_id}/policies/iam.automaticIamGrantsForDefaultServiceAccounts"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.automatic_iam_grants ? "TRUE" : "FALSE"
    }
  }
}
