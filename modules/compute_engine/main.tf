# Boolean Policies
resource "google_org_policy_policy" "disable_internet_neg" {
  name   = "projects/${var.project_id}/policies/compute.disableInternetNetworkEndpointGroup"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.disable_internet_network_endpoint_groups ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_nested_virtualization" {
  name   = "projects/${var.project_id}/policies/compute.disableNestedVirtualization"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.disable_nested_virtualization ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_serial_port_access" {
  name   = "projects/${var.project_id}/policies/compute.disableSerialPortAccess"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.disable_serial_port_access ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "disable_serial_port_logging" {
  name   = "projects/${var.project_id}/policies/compute.disableSerialPortLogging"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.disable_serial_port_logging ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "require_os_login" {
  name   = "projects/${var.project_id}/policies/compute.requireOsLogin"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.require_os_login ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "require_shielded_vm" {
  name   = "projects/${var.project_id}/policies/compute.requireShieldedVm"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.require_shielded_vm ? "TRUE" : "FALSE"
    }
  }
}

resource "google_org_policy_policy" "skip_default_network_creation" {
  name   = "projects/${var.project_id}/policies/compute.skipDefaultNetworkCreation"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      enforce = var.skip_default_network_creation ? "TRUE" : "FALSE"
    }
  }
}

# List Policies
resource "google_org_policy_policy" "trusted_image_projects" {
  count  = length(var.trusted_image_projects) > 0 ? 1 : 0
  name   = "projects/${var.project_id}/policies/compute.trustedImageProjects"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      values {
        allowed_values = var.trusted_image_projects
      }
    }
  }
}

resource "google_org_policy_policy" "vm_can_ip_forward" {
  count  = length(var.vm_can_ip_forward) > 0 ? 1 : 0
  name   = "projects/${var.project_id}/policies/compute.vmCanIpForward"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      values {
        allowed_values = var.vm_can_ip_forward
      }
    }
  }
}

resource "google_org_policy_policy" "vm_external_ip_access" {
  count  = length(var.vm_external_ip_access) > 0 ? 1 : 0
  name   = "projects/${var.project_id}/policies/compute.vmExternalIpAccess"
  parent = "projects/${var.project_id}"

  spec {
    rules {
      values {
        allowed_values = var.vm_external_ip_access
      }
    }
  }
}
