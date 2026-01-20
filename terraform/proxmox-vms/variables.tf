variable "proxmox_endpoint" {
  type        = string
  description = "e.g. https://pve.example.com:8006/api2/json"
}

variable "proxmox_api_token" {
  type        = string
  description = "e.g. terraform@pve!gitops=xxxxxxxx"
  sensitive   = true
}

# VM作成に進むときに使う（今は未使用でもOK）
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
  default     = 0
}
