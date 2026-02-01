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
    user_data = <<-EOF
users:
  - default
  - name: bababa
    groups: [sudo]
    shell: /bin/bash
    
  - name: ansible
    groups: [sudo]
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFqxA0d7VVlG4w3dRAeGSPeQnXddOBqXdwIz7ZbAg6+W bababa@worker-ubuntu

#cloud-config
package_update: true
packages:
  - qemu-guest-agent

runcmd:
  - systemctl enable qemu-guest-agent
  - systemctl start qemu-guest-agent
EOF
    
  }
  agent {
    enabled = true
  }
}
