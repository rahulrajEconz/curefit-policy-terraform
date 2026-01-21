# Curefit Terraform - GCP Organization Policies

This repository provides a high-level, human-friendly way to manage Google Cloud Platform (GCP) Organization Policies using Terraform. It is designed to mirror the **GCP Console's Condition Builder** while providing the automation and precision of Infrastructure as Code.

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

This project is organized into domain-specific modules for better maintainability:

| Module | Description |
| :--- | :--- |
| [**GCP Core**](./modules/gcp_core) | General resource location and basic GCP restrictions. |
| [**Cloud Storage**](./modules/cloud_storage) | Security for buckets (Public Access, UBLA, Retention). |
| [**Compute Engine**](./modules/compute_engine) | VM and Network security (Serial Port, OS-Login, Shielded VMs). |
| [**IAM**](./modules/iam) | Service Account controls and domain restrictions. |
| [**Resource Manager**](./modules/resource_manager) | Project-level liens and hierarchy controls. |
| [**Service Consumer**](./modules/service_consumer) | Service-level IAM grants and API controls. |

---

## 🛠️ Configuration Guide (`terraform.tfvars`)

### 1. Simple Enforcement
To apply a policy to projects without conditions:
```hcl
require_os_login = {
  project_ids = ["proj-a", "proj-b"]
  rules       = [{ enforce = true }]
}
```

### 2. Boolean Policy Requirements (CRITICAL)
GCP enforces strict logic for Boolean policies (Enforce On/Off):
1. **Unconditional Rule**: You MUST include one rule without tags/conditions to serve as the default.
2. **Opposite Exceptions**: Conditional rules MUST have the **opposite value** of the base rule.

**Correct Example:**
```hcl
disable_serial_port_access = {
  project_ids = ["my-project"]
  rules = [
    { enforce = true }, # 1. BASE: Enforce everywhere by default
    {
      title   = "Exception for Dev"
      enforce = false   # 2. EXCEPTION: Must be 'false' if base is 'true'
      tags    = { "env" = "dev" }
    }
  ]
}
```

---

## 🧠 Custom Condition Expressions (CEL)

The system automatically generates CEL expressions based on the `tags` and `tag_ids` maps. Here is how they map to Console Operators:

### Mapping Table

| Console Operator | Input Field | Condition Expression Generator |
| :--- | :--- | :--- |
| **has key** | `tags = { "k" = "*" }` | `resource.matchTag('k', '*')` |
| **has value** | `tags = { "k" = "v" }` | `resource.matchTag('k', 'v')` |
| **has key ID** | `tag_ids = { "k_id" = "*" }` | `resource.matchTagId('k_id', '*')` |
| **has value ID** | `tag_ids = { "k_id" = "v_id" }` | `resource.matchTagId('k_id', 'v_id')` |

### How Logic is Joined
If you provide multiple keys, the system joins them with `&&` (AND logic):
```hcl
tags = {
  "env"  = "prod"
  "tier" = "*"
}
# Resulting CEL:
# resource.matchTag('env', 'prod') && resource.matchTag('tier', '*')
```

---

## 🏁 Execution

1. **Initialize**: `terraform init`
2. **Validate**: `terraform validate`
3. **Plan**: `terraform plan`
4. **Apply**: `terraform apply`
