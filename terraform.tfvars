# ==============================================================================
# UNIVERSAL PER-POLICY PROJECT CONTROL (CONSOLE ALIGNED)
# ==============================================================================
# - project_ids: List of projects to apply this specific policy to.
# - rules: Same structure as the GCP Console "Edit Policy" and "Condition Builder".
# - title/description: Console-visible metadata for the rule.
# - tags: For "has key" (value="*") or "has value". (Uses matchTag)
# - tag_ids: For "has key ID" or "has value ID". (Uses matchTagId)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. GCP CORE POLICIES (gcp_core module)
# ------------------------------------------------------------------------------
allowed_resource_locations = {
  project_ids = ["test-tf-484914"]
  rules = [
    {
      title          = "Regional Restriction"
      description    = "Only allow Mumbai region for production environments"
      allowed_values = ["asia-south1"]
      tags = {
        "12345/environment" = "prod"
      }
    }
  ]
}

# ------------------------------------------------------------------------------
# 2. CLOUD STORAGE POLICIES (cloud_storage module)
# ------------------------------------------------------------------------------
enforce_public_access_prevention = {
  project_ids = ["test-tf-484914"]
  rules = [
    {
      title   = "Default Public Access Prevention"
      enforce = true
      tags    = {}
    }
  ]
}

enforce_uniform_bucket_level_access = {
  project_ids = ["test-tf-484914"]
  rules = [
    { enforce = true }
  ]
}

retention_policy_durations = {
  project_ids = []
  rules       = []
}

# ------------------------------------------------------------------------------
# 3. COMPUTE ENGINE POLICIES (compute_engine module)
# ------------------------------------------------------------------------------
disable_internet_network_endpoint_groups = {
  project_ids = ["test-tf-484914"]
  rules       = [{ enforce = false }]
}

disable_nested_virtualization = {
  project_ids = ["test-tf-484914"]
  rules       = [{ enforce = true }]
}

# Example: Multi-operator conditions and wildcards
disable_serial_port_access = {
  project_ids = ["test-tf-484914"]
  rules = [
    {
      title       = "Strict Security Rule"
      description = "Enforce on high-compliance projects"
      enforce     = true
      tags = {
        "12345/compliance" = "high" # "has value"
        "12345/security"   = "*"    # "has key" (Wildcard support)
      }
    },
    {
      title       = "ID-based Exclusion"
      description = "Exempt specific tag IDs"
      enforce     = false
      tag_ids = {
        "tagKeys/456" = "tagValues/789" # "has value ID"
      }
    }
  ]
}

disable_serial_port_logging   = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }
require_os_login              = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }
require_shielded_vm           = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }
skip_default_network_creation = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }
trusted_image_projects        = { project_ids = [], rules = [] }
vm_can_ip_forward             = { project_ids = [], rules = [] }

vm_external_ip_access = {
  project_ids = ["test-tf-484914"]
  rules = [
    {
      title         = "External IP Block"
      denied_values = ["projects/prod-project/zones/us-central1-a/instances/untrusted-vm"]
      tags = {
        "12345/security" = "strict"
      }
    }
  ]
}

# ------------------------------------------------------------------------------
# 4. IAM POLICIES (iam module)
# ------------------------------------------------------------------------------
disable_service_account_creation       = { project_ids = ["test-tf-484914"], rules = [{ enforce = false }] }
disable_service_account_key_creation   = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }
disable_service_account_key_upload     = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }
allowed_policy_member_domains          = { project_ids = [], rules = [] }
allow_sa_credential_lifetime_extension = { project_ids = [], rules = [] }

# ------------------------------------------------------------------------------
# 5. RESOURCE MANAGER POLICIES (resource_manager module)
# ------------------------------------------------------------------------------
restrict_xpn_project_lien_removal = { project_ids = ["test-tf-484914"], rules = [{ enforce = true }] }

# ------------------------------------------------------------------------------
# 6. SERVICE CONSUMER POLICIES (service_consumer module)
# ------------------------------------------------------------------------------
automatic_iam_grants = { project_ids = ["test-tf-484914"], rules = [{ enforce = false }] }
