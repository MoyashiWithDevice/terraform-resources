resource "github_repository_file" "inventory" {
  repository          = "ansible-resources"
  branch              = "main"
  file                = "inventory.ini"
  
  # inventory.tftpl を元に、作成したVMのIPを流し込む
  content = templatefile("${path.module}/inventory.tftpl", {
    vms = [
      proxmox_virtual_environment_vm.kube_ctrl,
      proxmox_virtual_environment_vm.kube_worker_rhel,
      proxmox_virtual_environment_vm.kube_worker_ubuntu,
      proxmox_virtual_environment_vm.nfs_server,
      proxmox_virtual_environment_vm.truenas,
      proxmox_virtual_environment_vm.test_server,
    ]
  })

  commit_message      = "Update inventory.ini by Terraform [skip ci]"
  overwrite_on_create = true
}