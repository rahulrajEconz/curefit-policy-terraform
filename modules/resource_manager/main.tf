resource "google_org_policy_policy" "restrict_xpn_project_lien_removal" {
  name   = "organizations/${var.organization_id}/policies/compute.restrictXpnProjectLienRemoval"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = var.restrict_xpn_project_lien_removal ? "TRUE" : "FALSE"
    }
  }
}
