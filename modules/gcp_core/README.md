# GCP Core Policies Module

This module manages general Google Cloud Platform organization policies.

## Managed Policies

| Policy Constraint | Description |
| :--- | :--- |
| `gcp.resourceLocations` | Restricts the locations (regions/zones) where GCP resources can be created. |

## Variables

### `allowed_resource_locations`
- `project_ids`: List of projects to apply this policy to.
- `rules`: List of rules with `allowed_values`, `denied_values`, `tags`, and `tag_ids`.

## Example Configuration

```hcl
allowed_resource_locations = {
  project_ids = ["test-project-123"]
  rules = [
    {
      title          = "Mumbai Only"
      allowed_values = ["in:asia-south1-locations"]
      tags = {
        "12345/environment" = "prod"
      }
    }
  ]
}
```
