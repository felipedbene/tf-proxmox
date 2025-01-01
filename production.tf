resource "proxmox_vm_qemu" "productionApp" {
  vmid = 200
  name        = "prod-app"
  target_node = "pve-1"
  clone = "wk-lnx-rhel1"
  full_clone = false
  scsihw = "virtio-scsi-single"
  cores = 4
  memory = 8192
  agent = 1

    disks {
        scsi {
            scsi0 {
                disk     {
                    size = "100G"
                    storage = "local-lvm"
                    format = "raw"
                }
            }
        }
    }
      network {
    id = 0
    model      = "virtio"
    bridge     = "vmbr1"
    mtu        = 9000
    firewall   = false
  }
  
}

resource "proxmox_vm_qemu" "productionDB" {
  vmid = 300
  name        = "prod-DB"
  target_node = "pve-1"
  clone = "wk-lnx-rhel1"
  full_clone = false
  scsihw = "virtio-scsi-single"
  cores = 4
  memory = 8192
  agent = 1

    disks {
        scsi {
            scsi0 {
                disk     {
                    size = "100G"
                    storage = "local-lvm"
                    format = "raw"
                }
            }
        }
    }
      network {
    id = 0
    model      = "virtio"
    bridge     = "vmbr1"
    mtu        = 9000
    firewall   = false
  }
  
}