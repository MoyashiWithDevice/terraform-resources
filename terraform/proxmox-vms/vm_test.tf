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
    
    interface = "ide2"
    user_account{
      username = "bababa"
      keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFqxA0d7VVlG4w3dRAeGSPeQnXddOBqXdwIz7ZbAg6+W bababa@worker-ubuntu"]
    }
    
    ip_config{
      ipv4{
        address = "172.31.0.13/24"
        gateway = "172.31.0.254"
      }
    }
  }
}
