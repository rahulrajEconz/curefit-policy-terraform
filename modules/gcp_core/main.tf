resource "google_org_policy_policy" "resource_location_restriction" {
  name   = "projects/${var.project_id}/policies/gcp.resourceLocations"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      values {
        allowed_values = var.allowed_resource_locations
      }
    }
  }
}
