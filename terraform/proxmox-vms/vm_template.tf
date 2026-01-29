# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "ubuntu_temp" {
  acpi                                 = true
  bios                                 = "seabios"
  boot_order                           = ["scsi0", "net0"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = null
  kvm_arguments                        = null
  mac_addresses                        = ["BC:24:11:7E:A1:84"]
  machine                              = null
  migrate                              = false
  name                                 = "Ubuntu24.04-template"
  node_name                            = "proxmox-host1"
  on_boot                              = true
  pool_id                              = null
  protection                           = false
  purge_on_destroy                     = true
  reboot                               = true
  reboot_after_update                  = true
  scsi_hardware                        = "virtio-scsi-single"
  started                              = false
  stop_on_destroy                      = false
  tablet_device                        = true
  tags                                 = ["template"]
  template                             = true
  timeout_clone                        = 1800
  timeout_create                       = 1800
  timeout_migrate                      = 1800
  timeout_reboot                       = 1800
  timeout_shutdown_vm                  = 1800
  timeout_start_vm                     = 1800
  timeout_stop_vm                      = 300
  vm_id                                = 9000
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
    iothread          = true
    replicate         = true
    serial            = null
    size              = 32
    ssd               = false
  }
  memory {
    dedicated      = 2048
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
    mac_address  = "BC:24:11:7E:A1:84"
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
}