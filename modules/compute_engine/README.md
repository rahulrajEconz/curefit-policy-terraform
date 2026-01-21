# Compute Engine Policies Module

This module manages security and operational policies for Google Compute Engine and VPC Networking.

## Managed Policies

### Boolean Policies (Enforce TRUE/FALSE)
| Policy Constraint | Description |
| :--- | :--- |
| `compute.disableInternetNetworkEndpointGroup` | Prevents creation of Internet NEGs. |
| `compute.disableNestedVirtualization` | Disables nested virtualization for VM instances. |
| `compute.disableSerialPortAccess` | Disables access to VM serial ports. |
| `compute.disableSerialPortLogging` | Disables VM serial port logging to Stackdriver. |
| `compute.requireOsLogin` | Enforces OS Login for all VM instances in the project. |
| `compute.requireShieldedVm` | Requires all VM instances to be created as Shielded VMs. |
| `compute.skipDefaultNetworkCreation` | Skips the creation of the default network during project creation. |

### List Policies (Allowed/Denied Values)
| Policy Constraint | Description |
| :--- | :--- |
| `compute.trustedImageProjects` | Restricts the projects from which VM images can be used. |
| `compute.vmCanIpForward` | Restricts which VMs are allowed to use IP forwarding. |
| `compute.vmExternalIpAccess` | Restricts which VMs are allowed to have external IP addresses. |

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
