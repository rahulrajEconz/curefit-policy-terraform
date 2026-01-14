resource "google_org_policy_policy" "automatic_iam_grants" {
  name   = "organizations/${var.organization_id}/policies/iam.automaticIamGrantsForDefaultServiceAccounts"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.automatic_iam_grants ? "TRUE" : "FALSE"
    }
  }
}
