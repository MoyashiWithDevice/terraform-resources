terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }
  
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "proxmox" {
  insecure = true

  ssh{
    agent = false
    username = 
  }
}

provider "github" {
  # token = var.github_token
  owner = "MoyashiWithDevice" # あなたのGitHubユーザー名または組織名
}