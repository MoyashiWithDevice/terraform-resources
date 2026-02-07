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
    
    ip_config{
      ipv4{
        address = "172.31.0.13/24"
        gateway = "172.31.0.254"
      }
    }
    
    user = "ansible"
    sshkeys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBL/kEsjJ+fb3432waZDbiTvLIwG+0pVNc4WAG179rVDqzDeX6xahWJu9taWZY1hszJuf8f1RMzBW7WHjrQ7M17s= bababa@k8s"
    ]
    
    #cloud-config
    package_update: true
    packages:
      - qemu-guest-agent

    runcmd:
      - echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible
      - chmod 440 /etc/sudoers.d/ansible
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
    
  }
  agent {
    enabled = true
  }
}
