# Cloud Storage Policies Module

This module manages security policies for Google Cloud Storage buckets.

## Managed Policies

| Policy Constraint | Description |
| :--- | :--- |
| `storage.publicAccessPrevention` | Prevents public access to data in your Cloud Storage buckets. |
| `storage.uniformBucketLevelAccess` | Enforces uniform bucket-level access on Cloud Storage buckets. |
| `storage.retentionPolicySeconds` | Restricts the allowed retention periods for Cloud Storage buckets. |

## Variables

### `enforce_public_access_prevention`
Boolean policy to enforce Public Access Prevention.

### `enforce_uniform_bucket_level_access`
Boolean policy to enforce Uniform Bucket Level Access.

### `retention_policy_durations`
List policy to restrict retention durations (in seconds).

## Example Configuration

```hcl
enforce_public_access_prevention = {
  project_ids = ["my-storage-project"]
  rules = [
    { enforce = true } # Unconditional base rule
  ]
}

retention_policy_durations = {
  project_ids = ["my-storage-project"]
  rules = [
    {
      allowed_values = ["86400", "604800"] # 1 day, 1 week
      tags = { "env" = "prod" }
    }
  ]
}
```
