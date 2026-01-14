resource "google_organization_policy" "automatic_iam_grants" {
  org_id     = var.organization_id
  constraint = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.automatic_iam_grants ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.automatic_iam_grants
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}
