resource "google_organization_policy" "restrict_xpn_project_lien_removal" {
  org_id     = var.organization_id
  constraint = "constraints/compute.restrictXpnProjectLienRemoval"

  boolean_policy {
    enforced = var.restrict_xpn_project_lien_removal
  }
}
