# tf-proxmox
Very minimal study repo to explore creating VMs using Teraform.

Terraform module to automate the provisioning and management of Proxmox virtual machines.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

`tf-proxmox` is a Terraform module designed to simplify the creation and management of virtual machines on Proxmox. It supports various customization options, including resource allocation, networking, and storage.

---

## Prerequisites

Before using this module, ensure you have the following:

1. **Proxmox VE**: Version 6.0 or newer.
2. **Terraform**: Version 1.0.0 or newer.
3. **API Token**: Ensure API access is enabled in your Proxmox VE setup.
4. **Proxmox Provider**: Installed in your Terraform environment.

Install the Proxmox provider:
```bash
terraform init
```

---

## Installation

Clone this repository or include it as a module in your Terraform configuration:
```hcl
module "proxmox_vm" {
  source = "github.com/felipedbene/tf-proxmox"
  
  # Example parameters
  vm_name   = "example-vm"
  cores     = 2
  memory    = 2048
  disk_size = "20G"
}
```

---

## Usage

### Inputs

| Name          | Description                                | Type     | Default     | Required |
|---------------|--------------------------------------------|----------|-------------|----------|
| `vm_name`     | Name of the virtual machine               | `string` | n/a         | Yes      |
| `cores`       | Number of CPU cores allocated             | `number` | `1`         | No       |
| `memory`      | Amount of RAM in MB                       | `number` | `1024`      | No       |
| `disk_size`   | Disk size allocated to the VM             | `string` | `"10G"`     | No       |
| `network`     | Network interface configuration           | `string` | `"default"` | No       |

### Outputs

| Name             | Description                                     |
|------------------|-------------------------------------------------|
| `vm_id`         | ID of the created VM                            |
| `vm_ip`         | IP address of the created VM (if available)     |
| `vm_status`     | Status of the VM (e.g., running, stopped)       |

---

## Examples

### Basic Usage

```hcl
module "proxmox_vm" {
  source    = "github.com/felipedbene/tf-proxmox"
  vm_name   = "web-server"
  cores     = 4
  memory    = 8192
  disk_size = "50G"
  network   = "vmbr0"
}
```
### Plan and Apply Command:

```bash
docker-compose -f docker-compose.yml run --rm terraform plan 
```

```bash
docker-compose -f docker-compose.yml run --rm terraform plan 
```

### Advanced Usage with Multiple VMs

```hcl
module "proxmox_vms" {
  source = "github.com/felipedbene/tf-proxmox"
  
  for_each = {
    app1 = { cores = 2, memory = 4096, disk_size = "20G" }
    app2 = { cores = 4, memory = 8192, disk_size = "50G" }
  }
  
  vm_name   = each.key
  cores     = each.value.cores
  memory    = each.value.memory
  disk_size = each.value.disk_size
  network   = "vmbr0"
}
```

---

## Contributing

Contributions are welcome! To get started:

1. Fork the repository.
2. Create a new branch: `git checkout -b my-feature`.
3. Commit your changes: `git commit -m "Add my feature"`.
4. Push to your branch: `git push origin my-feature`.
5. Open a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE).


Based on [YouTube Video](https://www.youtube.com/watch?v=zrhLGAZXQeo)