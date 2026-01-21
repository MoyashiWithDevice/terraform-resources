variable "endpoint" {
  type        = string
  default     = "https://<PROXMOX_IP>:8006/api2/json"
  description = "Proxmox API endpoint"
}

variable "api_token" {
  type      = string
  sensitive = true
}

variable "target_node" {
  type        = string
  default     = "pve"
}

variable "bridge" {
  type        = string
  default     = "vmbr31"
}

variable "template_vmid" {
  type        = number
  default     = 106
}
