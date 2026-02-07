variable "endpoint" {
  type        = string
  default     = "https://<PROXMOX_IP>:8006/api2/json"
  description = "Proxmox API endpoint"
}

variable "api_token" {
  type      = string
  sensitive = true
}

variable "username" {
  type    = string
}

variable "password" {
  type    = string
}

variable "target_node" {
  type        = string
  default     = "proxmox-host1"
}

variable "bridge" {
  type        = string
  default     = "vmbr31"
}

variable "template_vmid" {
  type        = number
  default     = 9000
}
