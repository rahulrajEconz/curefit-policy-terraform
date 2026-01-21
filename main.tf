module "gcp_core" {
  source                     = "./modules/gcp_core"
  allowed_resource_locations = var.allowed_resource_locations
}

module "cloud_storage" {
  source                              = "./modules/cloud_storage"
  enforce_public_access_prevention    = var.enforce_public_access_prevention
  enforce_uniform_bucket_level_access = var.enforce_uniform_bucket_level_access
  retention_policy_durations          = var.retention_policy_durations
}

module "compute_engine" {
  source                                   = "./modules/compute_engine"
  disable_internet_network_endpoint_groups = var.disable_internet_network_endpoint_groups
  disable_nested_virtualization            = var.disable_nested_virtualization
  disable_serial_port_access               = var.disable_serial_port_access
  disable_serial_port_logging              = var.disable_serial_port_logging
  require_os_login                         = var.require_os_login
  require_shielded_vm                      = var.require_shielded_vm
  skip_default_network_creation            = var.skip_default_network_creation
  trusted_image_projects                   = var.trusted_image_projects
  vm_can_ip_forward                        = var.vm_can_ip_forward
  vm_external_ip_access                    = var.vm_external_ip_access
}

module "iam" {
  source                                 = "./modules/iam"
  disable_service_account_creation       = var.disable_service_account_creation
  disable_service_account_key_creation   = var.disable_service_account_key_creation
  disable_service_account_key_upload     = var.disable_service_account_key_upload
  allowed_policy_member_domains          = var.allowed_policy_member_domains
  allow_sa_credential_lifetime_extension = var.allow_sa_credential_lifetime_extension
}

module "resource_manager" {
  source                            = "./modules/resource_manager"
  restrict_xpn_project_lien_removal = var.restrict_xpn_project_lien_removal
}

module "service_consumer" {
  source               = "./modules/service_consumer"
  automatic_iam_grants = var.automatic_iam_grants
}
