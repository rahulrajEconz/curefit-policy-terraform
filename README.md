# Curefit Terraform - GCP Organization Policies

This repository contains Terraform modules to manage Google Cloud Platform (GCP) Organization Policies for the Curefit project. It enforces security best practices across the organization.

## Project Structure

```
.
├── main.tf                 # Root module instantiating all sub-modules
├── variables.tf            # Input variables for the root module
├── terraform.tfvars        # Variable definitions (example values)
└── modules/                # Reusable Terraform modules
    ├── gcp_core            # General GCP organization policies
    ├── cloud_storage       # Storage bucket security policies
    ├── compute_engine      # VM and network security policies
    ├── iam                 # Identity and Access Management policies
    ├── resource_manager    # Resource hierarchy policies
    └── service_consumer    # Service consumer policies
```

## Prerequisites

- **Terraform**: v1.0 or later recommended.
- **GCP Credentials**: You must have `roles/orgpolicy.policyAdmin` on the Organization.
    - Run `gcloud auth application-default login` to set up local credentials.

## Usage

### 1. Initialize
Initialize the Terraform workspace to download providers and modules.
```bash
terraform init
```

### 2. Configure Variables
The main required variable is `organization_id`.
You can set it in `terraform.tfvars` or pass it via command line:
```bash
terraform plan -var="organization_id=123456789012"
```

**Key Variables:**
- `organization_id`: (Required) The ID of your GCP Organization.
- `allowed_resource_locations`: List of allowed GCP regions/zones.
- `trusted_image_projects`: List of projects allowed for VM images.

Most security booleans (e.g., `disable_service_account_creation`) default to `true` for a "secure by default" posture. See `variables.tf` for all options.

### 3. Plan
Preview the changes that Terraform will make.
```bash
terraform plan
```

### 4. Apply
Apply the changes to your GCP Organization.
```bash
terraform apply
```

## Modules

The logic is split into domain-specific modules in the `modules/` directory. Each module manages a set of related Organization Policy constraints.
