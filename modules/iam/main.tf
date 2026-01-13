resource "google_organization_policy" "disable_sa_creation" {
  org_id     = var.organization_id
  constraint = "constraints/iam.disableServiceAccountCreation"

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
    }
  }
}

resource "google_organization_policy" "allow_sa_credential_lifetime_extension" {
  count      = length(var.allow_sa_credential_lifetime_extension) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/iam.allowServiceAccountCredentialLifetimeExtension"

  list_policy {
    allow {
      values = var.allow_sa_credential_lifetime_extension
    }
  }
}
