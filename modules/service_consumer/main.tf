resource "google_organization_policy" "automatic_iam_grants" {
  org_id     = var.organization_id
  constraint = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"

  boolean_policy {
    enforced = var.automatic_iam_grants
  }
}
