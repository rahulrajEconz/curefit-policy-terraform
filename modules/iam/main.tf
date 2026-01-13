resource "google_org_policy_policy" "disable_sa_creation" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountCreation"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = var.disable_service_account_creation ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_sa_key_creation" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyCreation"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = var.disable_service_account_key_creation ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_sa_key_upload" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyUpload"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = var.disable_service_account_key_upload ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "allowed_policy_member_domains" {
  count  = length(var.allowed_policy_member_domains) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/iam.allowedPolicyMemberDomains"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        allowed_values = var.allowed_policy_member_domains
      }
    }
  }
}

resource "google_org_policy_policy" "allow_sa_credential_lifetime_extension" {
  count  = length(var.allow_sa_credential_lifetime_extension) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/iam.allowServiceAccountCredentialLifetimeExtension"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        allowed_values = var.allow_sa_credential_lifetime_extension
      }
    }
  }
}
