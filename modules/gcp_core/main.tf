resource "google_organization_policy" "resource_location_restriction" {
  org_id     = var.organization_id
  constraint = "constraints/gcp.resourceLocations"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      values {
        allowed_values = var.allowed_resource_locations
      }
=======
  list_policy {
    allow {
      values = var.allowed_resource_locations
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}
