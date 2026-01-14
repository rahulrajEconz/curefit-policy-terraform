resource "google_organization_policy" "restrict_xpn_project_lien_removal" {
  org_id     = var.organization_id
  constraint = "constraints/compute.restrictXpnProjectLienRemoval"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.restrict_xpn_project_lien_removal ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.restrict_xpn_project_lien_removal
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}
