resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = "local" # スニペットを保存するストレージ名
  node_name    = var.target_node

  source_raw {
    file_name = "setup-cloud-config.yaml"
    data      = <<EOF
#cloud-config
users:
  - name: ansible
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBL/kEsjJ+fb3432waZDbiTvLIwG+0pVNc4WAG179rVDqzDeX6xahWJu9taWZY1hszJuf8f1RMzBW7WHjrQ7M17s= bababa@k8s

package_update: true
packages:
  - qemu-guest-agent

runcmd:
  - systemctl enable qemu-guest-agent
  - systemctl start qemu-guest-agent
EOF
  }
}