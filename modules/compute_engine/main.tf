# Boolean Policies
resource "google_org_policy_policy" "disable_internet_neg" {
  for_each = toset(var.disable_internet_network_endpoint_groups.project_ids)
  name     = "projects/${each.value}/policies/compute.disableInternetNetworkEndpointGroup"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_internet_network_endpoint_groups.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "disable_nested_virtualization" {
  for_each = toset(var.disable_nested_virtualization.project_ids)
  name     = "projects/${each.value}/policies/compute.disableNestedVirtualization"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_nested_virtualization.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "disable_serial_port_access" {
  for_each = toset(var.disable_serial_port_access.project_ids)
  name     = "projects/${each.value}/policies/compute.disableSerialPortAccess"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_serial_port_access.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "disable_serial_port_logging" {
  for_each = toset(var.disable_serial_port_logging.project_ids)
  name     = "projects/${each.value}/policies/compute.disableSerialPortLogging"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.disable_serial_port_logging.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "require_os_login" {
  for_each = toset(var.require_os_login.project_ids)
  name     = "projects/${each.value}/policies/compute.requireOsLogin"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.require_os_login.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "require_shielded_vm" {
  for_each = toset(var.require_shielded_vm.project_ids)
  name     = "projects/${each.value}/policies/compute.requireShieldedVm"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.require_shielded_vm.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

resource "google_org_policy_policy" "skip_default_network_creation" {
  for_each = toset(var.skip_default_network_creation.project_ids)
  name     = "projects/${each.value}/policies/compute.skipDefaultNetworkCreation"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.skip_default_network_creation.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        enforce = rules.value.enforce != null ? (rules.value.enforce ? "TRUE" : "FALSE") : null
      }
    }
  }
}

# List Policies
resource "google_org_policy_policy" "trusted_image_projects" {
  for_each = toset(var.trusted_image_projects.project_ids)
  name     = "projects/${each.value}/policies/compute.trustedImageProjects"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.trusted_image_projects.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        dynamic "values" {
          for_each = (rules.value.allowed_values != null || rules.value.denied_values != null) ? [1] : []
          content {
            allowed_values = rules.value.allowed_values
            denied_values  = rules.value.denied_values
          }
        }
      }
    }
  }
}

resource "google_org_policy_policy" "vm_can_ip_forward" {
  for_each = toset(var.vm_can_ip_forward.project_ids)
  name     = "projects/${each.value}/policies/compute.vmCanIpForward"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.vm_can_ip_forward.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        dynamic "values" {
          for_each = (rules.value.allowed_values != null || rules.value.denied_values != null) ? [1] : []
          content {
            allowed_values = rules.value.allowed_values
            denied_values  = rules.value.denied_values
          }
        }
      }
    }
  }
}

resource "google_org_policy_policy" "vm_external_ip_access" {
  for_each = toset(var.vm_external_ip_access.project_ids)
  name     = "projects/${each.value}/policies/compute.vmExternalIpAccess"
  parent   = "projects/${each.value}"

  spec {
    dynamic "rules" {
      for_each = var.vm_external_ip_access.rules
      content {
        dynamic "condition" {
          for_each = (length(rules.value.tags) > 0 || length(rules.value.tag_ids) > 0) ? [1] : []
          content {
            title       = rules.value.title != null ? rules.value.title : "Condition"
            description = rules.value.description
            expression = join(" && ", concat(
              [for k, v in rules.value.tags : "resource.matchTag('${k}', '${v}')"],
              [for k, v in rules.value.tag_ids : "resource.matchTagId('${k}', '${v}')"]
            ))
          }
        }
        dynamic "values" {
          for_each = (rules.value.allowed_values != null || rules.value.denied_values != null) ? [1] : []
          content {
            allowed_values = rules.value.allowed_values
            denied_values  = rules.value.denied_values
          }
        }
      }
    }
  }
}
