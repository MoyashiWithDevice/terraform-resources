# terraform/proxmox-vms/provider.tf
provider "github" {
  token = var.github_token
}
provider "proxmox" {
  # これらの値は TF-controller が Vault から読み取って環境変数として注入するため、
  # コード上では空にするか、環境変数経由で自動取得させます。
  pm_api_url = "https://<PROXMOX_IP>:8006/api2/json"
  
  # PM_API_TOKEN_ID と PM_API_TOKEN_SECRET という環境変数があれば
  # Providerはそれを優先して使用します。
  pm_tls_insecure = true
}