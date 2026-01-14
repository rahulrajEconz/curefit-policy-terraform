organization_id = "545817358872" # REPLACE WITH YOUR ORG ID

# GCP Core
allowed_resource_locations = ["asia-south1"]

# Cloud Storage
enforce_public_access_prevention    = true
enforce_uniform_bucket_level_access = true
retention_policy_durations          = [2592000] # Add allowed durations here if needed

# Compute Engine
disable_internet_network_endpoint_groups = false # Check if NEG is needed
disable_nested_virtualization            = true
disable_serial_port_access               = true
disable_serial_port_logging              = true
require_os_login                         = true
require_shielded_vm                      = true
skip_default_network_creation            = true
trusted_image_projects                   = [] # Add trusted projects
vm_can_ip_forward                        = [] # Add allowed instances
vm_external_ip_access                    = [] # Add allowed instances

# IAM
disable_service_account_creation       = false # Initial setup might need SAs
disable_service_account_key_creation   = true
disable_service_account_key_upload     = true # Default
# allowed_policy_member_domains          = ["C048fj9zg",
# "C04dpnca7",
# "C0155qupi",
# "C01tyg1t2",
# "C043hlq40"] # Add your domains
allow_sa_credential_lifetime_extension = [] # Add allowed SAs

# Resource Manager
restrict_xpn_project_lien_removal = true

# Service Consumer
automatic_iam_grants = false
