resource "google_organization_policy" "resource_location_restriction" {
  org_id     = var.organization_id
  constraint = "constraints/gcp.resourceLocations"

  list_policy {
    allow {
      values = var.allowed_resource_locations
    }
  }
}
