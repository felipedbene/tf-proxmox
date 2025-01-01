resource "proxmox_vm_qemu" "production" {
  vmid = 200
  name        = "Production"
  target_node = "pve-1"

  clone = "wk-lnx-rhel1"
  full_clone = false
  bios = "ovmf"
  agent = 1
  scsihw = "virtio-scsi-single"
  cpu = 4
  memory = 8192

disks {
    scsi {
        scsi0 {
            disk {
                size = "100G"
                storage = "local"
                format = "qcow2"
            }
        }
    }
}
  
}