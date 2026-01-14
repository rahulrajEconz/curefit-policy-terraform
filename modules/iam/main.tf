resource "google_organization_policy" "disable_sa_creation" {
  org_id     = var.organization_id
  constraint = "constraints/iam.disableServiceAccountCreation"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.disable_service_account_creation ? "TRUE" : "FALSE"
=======
  boolean_policy {
    enforced = var.disable_service_account_creation
  }
}

resource "google_organization_policy" "disable_sa_key_creation" {
  org_id     = var.organization_id
  constraint = "constraints/iam.disableServiceAccountKeyCreation"

  boolean_policy {
    enforced = var.disable_service_account_key_creation
  }
}

resource "google_organization_policy" "disable_sa_key_upload" {
  org_id     = var.organization_id
  constraint = "constraints/iam.disableServiceAccountKeyUpload"

  boolean_policy {
    enforced = var.disable_service_account_key_upload
  }
}

resource "google_organization_policy" "allowed_policy_member_domains" {
  count      = length(var.allowed_policy_member_domains) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/iam.allowedPolicyMemberDomains"

  list_policy {
    allow {
      values = var.allowed_policy_member_domains
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}

resource "google_organization_policy" "allow_sa_credential_lifetime_extension" {
  count      = length(var.allow_sa_credential_lifetime_extension) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/iam.allowServiceAccountCredentialLifetimeExtension"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.disable_service_account_key_creation ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_sa_key_upload" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyUpload"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.disable_service_account_key_upload ? "TRUE" : "FALSE"
    }
  }
}

/* already enabled
resource "google_org_policy_policy" "allowed_policy_member_domains" {
  count  = length(var.allowed_policy_member_domains) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/iam.allowedPolicyMemberDomains"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.allowed_policy_member_domains
      }
    }
  }
}
*/

resource "google_org_policy_policy" "allow_sa_credential_lifetime_extension" {
  count  = length(var.allow_sa_credential_lifetime_extension) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/iam.allowServiceAccountCredentialLifetimeExtension"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.allow_sa_credential_lifetime_extension
      }
=======
  list_policy {
    allow {
      values = var.allow_sa_credential_lifetime_extension
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}
