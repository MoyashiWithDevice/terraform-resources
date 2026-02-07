# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "nfs_server" {
  acpi                                 = true
  bios                                 = "seabios"
  boot_order                           = ["scsi0", "net0"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = null
  kvm_arguments                        = null
  mac_addresses                        = ["BC:24:11:85:38:66"]
  machine                              = null
  migrate                              = false
  name                                 = "nfs-server"
  node_name                            = "proxmox-host1"
  on_boot                              = true
  pool_id                              = null
  protection                           = false
  purge_on_destroy                     = true
  reboot                               = true
  reboot_after_update                  = true
  scsi_hardware                        = "virtio-scsi-single"
  started                              = true
  stop_on_destroy                      = false
  tablet_device                        = true
  tags                                 = []
  template                             = false
  timeout_clone                        = 1800
  timeout_create                       = 1800
  timeout_migrate                      = 1800
  timeout_reboot                       = 1800
  timeout_shutdown_vm                  = 1800
  timeout_start_vm                     = 1800
  timeout_stop_vm                      = 300
  vm_id                                = 103
  cpu {
    affinity     = null
    architecture = null
    cores        = 3
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "x86-64-v2-AES"
    units        = 1
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "data2"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi0"
    iothread          = true
    path_in_datastore = "vm-103-disk-0"
    replicate         = true
    serial            = null
    size              = 64
    ssd               = false
  }
  memory {
    dedicated      = 4096
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }
  network_device {
    bridge       = "vmbr31"
    disconnected = false
    enabled      = true
    firewall     = true
    mac_address  = "BC:24:11:85:38:66"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = null
    vlan_id      = 0
  }
  operating_system {
    type = "l26"
  }
  agent {
    enabled = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "truenas" {
  acpi                                 = true
  bios                                 = "ovmf"
  boot_order                           = ["scsi0", "scsi1"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = null
  kvm_arguments                        = null
  mac_addresses                        = ["00:0c:29:ae:72:f2"]
  machine                              = null
  migrate                              = false
  name                                 = "TrueNAS"
  node_name                            = "proxmox-host1"
  on_boot                              = true
  pool_id                              = null
  protection                           = false
  purge_on_destroy                     = true
  reboot                               = true
  reboot_after_update                  = true
  scsi_hardware                        = "pvscsi"
  started                              = true
  stop_on_destroy                      = false
  tablet_device                        = true
  tags                                 = []
  template                             = false
  timeout_clone                        = 1800
  timeout_create                       = 1800
  timeout_migrate                      = 1800
  timeout_reboot                       = 1800
  timeout_shutdown_vm                  = 1800
  timeout_start_vm                     = 1800
  timeout_stop_vm                      = 300
  vm_id                                = 102
  cpu {
    affinity     = null
    architecture = null
    cores        = 2
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "x86-64-v2-AES"
    units        = 1
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "local-lvm"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi0"
    iothread          = false
    path_in_datastore = "vm-102-disk-1"
    replicate         = true
    serial            = null
    size              = 16
    ssd               = false
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "data2"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi1"
    iothread          = false
    path_in_datastore = "vm-102-disk-0"
    replicate         = true
    serial            = null
    size              = 300
    ssd               = false
  }
  efi_disk {
    datastore_id      = "local"
    file_format       = "raw"
    pre_enrolled_keys = false
    type              = "4m"
  }
  memory {
    dedicated      = 8192
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }
  network_device {
    bridge       = "vmbr31"
    disconnected = false
    enabled      = true
    firewall     = false
    mac_address  = "00:0c:29:ae:72:f2"
    model        = "vmxnet3"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = null
    vlan_id      = 0
  }
  operating_system {
    type = "l26"
  }
  agent {
    enabled = true
  }
}
