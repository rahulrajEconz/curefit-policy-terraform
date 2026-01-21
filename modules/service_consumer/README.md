# Service Consumer Policies Module

This module manages policies related to service consumption and default IAM grants.

## Managed Policies

| Policy Constraint | Description |
| :--- | :--- |
| `iam.automaticIamGrantsForDefaultServiceAccounts` | Disables automatic IAM grants for default service accounts. |

## Variables

### `automatic_iam_grants`
Boolean policy to disable automatic IAM grants.

## Example Configuration

```hcl
automatic_iam_grants = {
  project_ids = ["consumer-project-456"]
  rules = [
    { enforce = true }
  ]
}
```
