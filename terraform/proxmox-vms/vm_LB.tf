# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "load_balancer" {
  count = 2
  
  name                                 = "lb-${count.index}"
  node_name                            = "proxmox-host1"
  vm_id                                = 110+ count.index

  clone{
    vm_id = var.template_vmid
    full = true
  }

  cpu{
    cores = 4
  }
  memory{
    dedicated = 4096
  }

  network_device {
    model = "virtio"
    bridge = "vmbr32"
  }
  
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 64
    file_format  = "raw"
  }
  boot_order = ["scsi0"]

  initialization {
    datastore_id = "local-lvm"
    interface = "ide2"

    ip_config{
      ipv4{
        address = "172.32.0.${100 + count.index}/24"
        gateway = "172.32.0.254"
      }
    }
    
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }  
  agent{
    enabled = true
  }
}