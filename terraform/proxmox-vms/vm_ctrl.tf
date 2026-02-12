# terraform/proxmox-vms/vm_test.tf
resource "proxmox_virtual_environment_vm" "test_server" {
  name        = "kube-ctrl-2"
  vm_id = 108
  node_name = var.target_node # Proxmoxのノード名

  clone{
    vm_id = var.template_vmid
  }
  cpu{
    cores = 4
  }
  memory{
    dedicated = 8192
  }

  network_device {
    model = "virtio"
    bridge = "vmbr32"
  }

  initialization {
    datastore_id = "local-lvm"
    interface = "ide2"
    
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id

    ip_config{
      ipv4{
        address = "172.32.0.10/24"
        gateway = "172.32.0.254"
      }
    }
  }
  agent {
    enabled = true
  }
}