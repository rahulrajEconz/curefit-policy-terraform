resource "google_org_policy_policy" "restrict_xpn_project_lien_removal" {
  name   = "projects/${var.project_id}/policies/compute.restrictXpnProjectLienRemoval"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.restrict_xpn_project_lien_removal ? "TRUE" : "FALSE"
    }
  }
}
