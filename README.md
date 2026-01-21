# Curefit Terraform - GCP Organization Policies

This repository provides a high-level, human-friendly way to manage GCP Organization Policies using Terraform. It is designed to mirror the **GCP Console's Condition Builder** while providing the automation and precision of Infrastructure as Code.

## 🚀 Key Features

- **Console Alignment**: Define policies with `title`, `description`, `tags`, and `tag_ids`—exactly as seen in the Google Cloud Console.
- **Universal Project Control**: Every single policy can be targeted to a specific, unique list of `project_ids`.
- **Operator Support**: 
    - **"has key"**: Using wildcards (`*`).
    - **"has value"**: Standard key-value matching.
    - **"has key ID" / "has value ID"**: Matching by immutable Tag IDs.
- **Advanced CEL Generation**: Automatically generates complex Common Expression Language (CEL) logic based on your inputs.

---

## 📂 Project Structure

```
.
├── main.tf                 # Root module (clean instantiation of domain modules)
├── variables.tf            # Universal schema definitions
├── terraform.tfvars        # YOUR CONFIGURATION (Project lists, rules, conditions)
└── modules/                # Domain-specific Resource Iterators
    ├── gcp_core            # General GCP restriction policies
    ├── cloud_storage       # Bucket security (PAP, UBLA, etc.)
    ├── compute_engine      # VM & Network security (Serial Port, OS-Login, etc.)
    ├── iam                 # IAM security (SA creation, domain restrictions)
    ├── resource_manager    # Resource hierarchy & Liens
    └── service_consumer    # API & Service grants
```

---

## 🛠️ Configuration Guide (`terraform.tfvars`)

Each policy is an object with two main fields: `project_ids` and `rules`.

### 1. Simple Enforcement
To apply a policy to a specific project without conditions:
```hcl
require_os_login = {
  project_ids = ["my-project-id"]
  rules       = [{ enforce = true }]
}
```

### 2. Multi-Project Support
You can target multiple projects per policy:
```hcl
disable_nested_virtualization = {
  project_ids = ["proj-dev", "proj-prod", "proj-security"]
  rules       = [{ enforce = true }]
}
```

### 3. Conditions & Operators (The Condition Builder)
The `rules` list supports several operator-aligned fields:

| Console Operator | Terraform Field | Example Value |
| :--- | :--- | :--- |
| **has key** | `tags` | `{ "123/env" = "*" }` |
| **has value** | `tags` | `{ "123/env" = "prod" }` |
| **has key ID** | `tag_ids` | `{ "tagKeys/123" = "*" }` |
| **has value ID** | `tag_ids` | `{ "tagKeys/123" = "tagValues/456" }` |

**Example with Metadata and Multi-Tag logic:**
```hcl
allowed_resource_locations = {
  project_ids = ["test-tf-project"]
  rules = [
    {
      title       = "Mumbai Prod Only"
      description = "Strict regional control for prod environments"
      allowed_values = ["asia-south1"]
      tags = {
        "123/environment" = "prod"
        "123/compliance"  = "*" # Only if a compliance tag IS PRESENT
      }
    }
  ]
}
```

---

## ⚙️ Prerequisites

- **Terraform**: v1.3+ (Uses optional object fields).
- **GCP Permissions**: `roles/orgpolicy.policyAdmin` at the Organization or Project level.
- **Authentication**: `gcloud auth application-default login`.

---

## 🏁 Execution

1. **Initialize** (downloads modules):
   ```bash
   terraform init
   ```

2. **Validate** (check syntax & logic):
   ```bash
   terraform validate
   ```

3. **Plan** (preview changes):
   ```bash
   terraform plan
   ```

4. **Apply** (deploy to GCP):
   ```bash
   terraform apply
   ```
