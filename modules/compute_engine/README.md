# Compute Engine Policies Module

This module manages security and operational policies for Google Compute Engine and VPC Networking.

## Managed Policies

### Boolean Policies (Enforce TRUE/FALSE)
| Policy Constraint | Description | Default Behavior (if project targeted) |
| :--- | :--- | :--- |
| `compute.disableInternetNetworkEndpointGroup` | Prevents creation of Internet NEGs. | **Enforced** |
| `compute.disableNestedVirtualization` | Disables nested virtualization for VM instances. | **Enforced** |
| `compute.disableSerialPortAccess` | Disables access to VM serial ports. | **Enforced** |
| `compute.disableSerialPortLogging` | Disables VM serial port logging to Stackdriver. | **Enforced** |
| `compute.requireOsLogin` | Enforces OS Login for all VM instances in the project. | **Enforced** |
| `compute.requireShieldedVm` | Requires all VM instances to be created as Shielded VMs. | **Enforced** |
| `compute.skipDefaultNetworkCreation` | Skips the creation of the default network during project creation. | **Enforced** |

### List Policies (Allowed/Denied Values)
| Policy Constraint | Description | Default Behavior (if project targeted) |
| :--- | :--- | :--- |
| `compute.trustedImageProjects` | Restricts the projects from which VM images can be used. | **No restrictions** |
| `compute.vmCanIpForward` | Restricts which VMs are allowed to use IP forwarding. | **No restrictions** |
| `compute.vmExternalIpAccess` | Restricts which VMs are allowed to have external IP addresses. | **No restrictions** |

## Example Configuration

```hcl
disable_serial_port_access = {
  project_ids = ["compute-proj-123"]
  rules = [
    { enforce = true }, # Base: Disable serial port access
    {
      title   = "Exception for Debugging"
      enforce = false
      tags    = { "debug" = "true" }
    }
  ]
}

vm_external_ip_access = {
  project_ids = ["compute-proj-123"]
  rules = [
    {
      denied_values = ["projects/example/zones/us-central1-a/instances/bastion"]
      tags = { "risk" = "high" }
    }
  ]
}
```
