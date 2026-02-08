# terraform/proxmox-vms/vm_test.tf
resource "proxmox_virtual_environment_vm" "test_server" {
  name        = "test-server"
  vm_id = 107
  node_name = var.target_node # Proxmoxのノード名

  clone{
    vm_id = var.template_vmid
  }
  cpu{
    cores = 2
  }
  memory{
    dedicated = 2048
  }

  network_device {
    model = "virtio"
    bridge = var.bridge
  }

  initialization {
    datastore_id = "local-lvm"
    interface = "ide2"
    
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id

    ip_config{
      ipv4{
        address = "172.31.0.13/24"
        gateway = "172.31.0.254"
      }
      disconnected = false
    }
  }
  agent {
    enabled = true
  }
}