resource "google_org_policy_policy" "resource_location_restriction" {
  name   = "organizations/${var.organization_id}/policies/gcp.resourceLocations"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.allowed_resource_locations
      }
    }
  }
}
