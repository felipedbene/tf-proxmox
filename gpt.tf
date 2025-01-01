resource "proxmox_vm_qemu" "vm202" {
#   vmid      = 202
#   name      = "vm-202"
  target_node = "pve-1"

  # Lite Cloning
  clone = "wk-lnx-rhel1"
  full_clone = false

  # VM Hardware
  memory    = 8192 # 8 GB
  cores     = 4    # 4 cores
  sockets   = 1    # 1 socket
  cpu_type  = "host"

  # BIOS Configuration
  bios      = "seabios"
  machine   = "pc-i440fx-7.1"
  
  # Guest Agent
    agent = 1
  # Disk Configuration
  disk {
    slot        = "scsi0"
    size        = "80G" # 60 GB
    storage     = "local-lvm"
  }

  # Network Configuration
  network {
    id = 0
    model      = "virtio"
    bridge     = "vmbr1"
    mtu        = 9000
    firewall   = false
  }

  scsihw     = "virtio-scsi-single"
}