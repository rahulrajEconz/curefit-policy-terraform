# IAM Policies Module

This module manages Identity and Access Management policies to secure service accounts and domain access.

## Managed Policies

### Boolean Policies
| Policy Constraint | Description | Default Behavior (if project targeted) |
| :--- | :--- | :--- |
| `iam.disableServiceAccountCreation` | Prevents creation of new Service Accounts. | **Enforced** |
| `iam.disableServiceAccountKeyCreation` | Prevents creation of new Service Account keys. | **Enforced** |
| `iam.disableServiceAccountKeyUpload` | Prevents uploading of external Service Account keys. | **Enforced** |

### List Policies
| Policy Constraint | Description | Default Behavior (if project targeted) |
| :--- | :--- | :--- |
| `iam.allowedPolicyMemberDomains` | Restricts the domains that can be added to IAM policies. | **No restrictions** |
| `iam.allowServiceAccountCredentialLifetimeExtension` | Restricts which SAs can extend credential lifetimes. | **No restrictions** |

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
