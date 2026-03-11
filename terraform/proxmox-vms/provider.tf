terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }

  backend "kubernetes" {
    namespace     = "flux-system"
    secret_suffix = "proxmox-vm-0311"
  }
}

provider "proxmox" {
  insecure = true

  endpoint = var.endpoint
  api_token = var.api_token

  ssh{
    agent = false
    username = var.username
    password = var.password
  }
}

provider "github" {
  # token = var.github_token
  owner = "MoyashiWithDevice" # あなたのGitHubユーザー名または組織名
}