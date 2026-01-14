# Boolean Policies
resource "google_org_policy_policy" "disable_internet_neg" {
  name   = "organizations/${var.organization_id}/policies/compute.disableInternetNetworkEndpointGroup"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.disable_internet_network_endpoint_groups ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_nested_virtualization" {
  name   = "organizations/${var.organization_id}/policies/compute.disableNestedVirtualization"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.disable_nested_virtualization ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_serial_port_access" {
  name   = "organizations/${var.organization_id}/policies/compute.disableSerialPortAccess"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.disable_serial_port_access ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_serial_port_logging" {
  name   = "organizations/${var.organization_id}/policies/compute.disableSerialPortLogging"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.disable_serial_port_logging ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "require_os_login" {
  name   = "organizations/${var.organization_id}/policies/compute.requireOsLogin"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.require_os_login ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "require_shielded_vm" {
  name   = "organizations/${var.organization_id}/policies/compute.requireShieldedVm"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.require_shielded_vm ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "skip_default_network_creation" {
  name   = "organizations/${var.organization_id}/policies/compute.skipDefaultNetworkCreation"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      enforce = var.skip_default_network_creation ? "TRUE" : "FALSE"
    }
  }
}

# List Policies
resource "google_org_policy_policy" "trusted_image_projects" {
  count  = length(var.trusted_image_projects) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/compute.trustedImageProjects"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.trusted_image_projects
      }
    }
  }
}

resource "google_org_policy_policy" "vm_can_ip_forward" {
  count  = length(var.vm_can_ip_forward) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/compute.vmCanIpForward"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.vm_can_ip_forward
      }
    }
  }
}

resource "google_org_policy_policy" "vm_external_ip_access" {
  count  = length(var.vm_external_ip_access) > 0 ? 1 : 0
  name   = "organizations/${var.organization_id}/policies/compute.vmExternalIpAccess"
  parent = "organizations/${var.organization_id}"

  dry_run_spec {
    rules {
      values {
        allowed_values = var.vm_external_ip_access
      }
    }
  }
}
