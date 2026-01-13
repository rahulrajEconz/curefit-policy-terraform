# Boolean Policies
resource "google_organization_policy" "disable_internet_neg" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableInternetNetworkEndpointGroup"

  boolean_policy {
    enforced = var.disable_internet_network_endpoint_groups
  }
}

resource "google_organization_policy" "disable_nested_virtualization" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableNestedVirtualization"

  boolean_policy {
    enforced = var.disable_nested_virtualization
  }
}

resource "google_organization_policy" "disable_serial_port_access" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableSerialPortAccess"

  boolean_policy {
    enforced = var.disable_serial_port_access
  }
}

resource "google_organization_policy" "disable_serial_port_logging" {
  org_id     = var.organization_id
  constraint = "constraints/compute.disableSerialPortLogging"

  boolean_policy {
    enforced = var.disable_serial_port_logging
  }
}

resource "google_organization_policy" "require_os_login" {
  org_id     = var.organization_id
  constraint = "constraints/compute.requireOsLogin"

  boolean_policy {
    enforced = var.require_os_login
  }
}

resource "google_organization_policy" "require_shielded_vm" {
  org_id     = var.organization_id
  constraint = "constraints/compute.requireShieldedVm"

  boolean_policy {
    enforced = var.require_shielded_vm
  }
}

resource "google_organization_policy" "skip_default_network_creation" {
  org_id     = var.organization_id
  constraint = "constraints/compute.skipDefaultNetworkCreation"

  boolean_policy {
    enforced = var.skip_default_network_creation
  }
}

# List Policies
resource "google_organization_policy" "trusted_image_projects" {
  count      = length(var.trusted_image_projects) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/compute.trustedImageProjects"

  list_policy {
    allow {
      values = var.trusted_image_projects
    }
  }
}

resource "google_organization_policy" "vm_can_ip_forward" {
  count      = length(var.vm_can_ip_forward) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/compute.vmCanIpForward"

  list_policy {
    allow {
      values = var.vm_can_ip_forward
    }
  }
}

resource "google_organization_policy" "vm_external_ip_access" {
  count      = length(var.vm_external_ip_access) > 0 ? 1 : 0
  org_id     = var.organization_id
  constraint = "constraints/compute.vmExternalIpAccess"

  list_policy {
    allow {
      values = var.vm_external_ip_access
    }
  }
}
