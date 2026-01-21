# Resource Manager Policies Module

This module manages policies related to the resource hierarchy and operational constraints.

## Managed Policies

| Policy Constraint | Description | Default Behavior (if project targeted) |
| :--- | :--- | :--- |
| `compute.restrictXpnProjectLienRemoval` | Restricts the removal of project liens for Shared VPC host projects. | **Enforced** |

## Variables

### `restrict_xpn_project_lien_removal`
Boolean policy to restrict Shared VPC host project lien removal.

## Example Configuration

```hcl
restrict_xpn_project_lien_removal = {
  project_ids = ["network-host-project"]
  rules = [
    { enforce = true }
  ]
}
```
