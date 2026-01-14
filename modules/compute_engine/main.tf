# Boolean Policies
resource "google_organization_policy" "disable_internet_neg" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableInternetNetworkEndpointGroup"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.disable_internet_network_endpoint_groups ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.disable_internet_network_endpoint_groups
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "disable_nested_virtualization" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableNestedVirtualization"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.disable_nested_virtualization ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.disable_nested_virtualization
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "disable_serial_port_access" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableSerialPortAccess"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.disable_serial_port_access ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.disable_serial_port_access
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "disable_serial_port_logging" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableSerialPortLogging"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.disable_serial_port_logging ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.disable_serial_port_logging
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "require_os_login" {
  org_id     = var.organization_id
  constraint = "constraints/compute.requireOsLogin"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.require_os_login ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.require_os_login
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "require_shielded_vm" {
  org_id     = var.organization_id
  constraint = "constraints/compute.requireShieldedVm"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.require_shielded_vm ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.require_shielded_vm
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

resource "google_organization_policy" "skip_default_network_creation" {
  org_id     = var.organization_id
  constraint = "constraints/compute.skipDefaultNetworkCreation"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      enforce = var.skip_default_network_creation ? "TRUE" : "FALSE"
    }
=======
  boolean_policy {
    enforced = var.skip_default_network_creation
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
  }
}

# List Policies
resource "google_organization_policy" "trusted_image_projects" {
  count      = length(var.trusted_image_projects) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/compute.trustedImageProjects"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      values {
        allowed_values = var.trusted_image_projects
      }
=======
  list_policy {
    allow {
      values = var.trusted_image_projects
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}

resource "google_organization_policy" "vm_can_ip_forward" {
  count      = length(var.vm_can_ip_forward) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/compute.vmCanIpForward"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      values {
        allowed_values = var.vm_can_ip_forward
      }
=======
  list_policy {
    allow {
      values = var.vm_can_ip_forward
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}

resource "google_organization_policy" "vm_external_ip_access" {
  count      = length(var.vm_external_ip_access) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/compute.vmExternalIpAccess"

<<<<<<< HEAD
  dry_run_spec {
    rules {
      values {
        allowed_values = var.vm_external_ip_access
      }
=======
  list_policy {
    allow {
      values = var.vm_external_ip_access
>>>>>>> parent of 1797bb3 (migrate to v3 from legacy)
    }
  }
}
