# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "ubuntu_temp" {
  machine                              = null
  name                                 = "Ubuntu24.04-template"
  node_name                            = "proxmox-host1"
  tags                                 = ["template"]
  template                             = true
  vm_id                                = 9000
  
  initialization {
    datastore_id = "local-lvm"
    interface = "ide2"

    ip_config{
      ipv4{
        gateway = "172.31.0.254"
      }
      disconnected = false
    }
    
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }  
  agent{
    enabled = true
  }
}