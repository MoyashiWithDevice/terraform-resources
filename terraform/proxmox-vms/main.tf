# terraform/proxmox-vms/main.tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }
}

data "proxmox_nodes" "all" {}

output "nodes" {
  value = data.proxmox_nodes.all.names
}

resource "proxmox_vm_qemu" "web_server" {
  count       = 1
  name        = "almalinux-${count.index}"
  target_node = "pve" # Proxmoxのノード名

  # クローン元のテンプレート名（あらかじめProxmoxで作っておく必要があります）
  clone = "Ubuntu24.04-template"

  # 基本スペック
  cores   = 2
  memory  = 2048

  # ディスク設定
  disk {
    size    = "20G"
    type    = "scsi"
    storage = "local-lvm"
  }

  # ネットワーク設定
  network {
    model  = "virtio"
    bridge = "vmbr31"
  }

  # Cloud-init設定（IP固定やSSHキーなど）
  os_type = "cloud-init"
  ipconfig0 = "ip=172.31.0.13${count.index}/24,gw=172.31.0.254"
}