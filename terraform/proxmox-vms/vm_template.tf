# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "ubuntu_temp" {
  machine                              = null
  tags                                 = ["template"]
  template                             = true

  name                                 = "Ubuntu24.04-template"
  node_name                            = "proxmox-host1"
  vm_id                                = 9000

  boot_order                           = ["scsi0", "net0"]

  cpu{
    cores = 2
    type  = "host"
  }
  memory{
    dedicated = 2048
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
    path_in_datastore = "base-9000-disk-0"
    replicate         = true
    serial            = null
    size              = 32
    ssd               = false
  }

  network_device {
    model = "virtio"
    bridge = var.bridge
  }
  
  initialization {
    datastore_id = "local-lvm"
    interface = "ide2"

    ip_config{
      ipv4{
        address = "dhcp"
      }
    }
    
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }  
  agent{
    enabled = true
  }
}