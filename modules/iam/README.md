# IAM Policies Module

This module manages Identity and Access Management policies to secure service accounts and domain access.

## Managed Policies

### Boolean Policies
| Policy Constraint | Description |
| :--- | :--- |
| `iam.disableServiceAccountCreation` | Prevents creation of new Service Accounts. |
| `iam.disableServiceAccountKeyCreation` | Prevents creation of new Service Account keys. |
| `iam.disableServiceAccountKeyUpload` | Prevents uploading of external Service Account keys. |

### List Policies
| Policy Constraint | Description |
| :--- | :--- |
| `iam.allowedPolicyMemberDomains` | Restricts the domains that can be added to IAM policies. |
| `iam.allowServiceAccountCredentialLifetimeExtension` | Restricts which SAs can extend credential lifetimes. |

## Example Configuration

```hcl
disable_service_account_key_creation = {
  project_ids = ["iam-secured-project"]
  rules = [
    { enforce = true }
  ]
}

allowed_policy_member_domains = {
  project_ids = ["iam-secured-project"]
  rules = [
    {
      allowed_values = ["C01234567"] # Domain ID
      tags = { "org" = "curefit" }
    }
  ]
}
```
