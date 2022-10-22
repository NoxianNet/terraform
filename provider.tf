terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.2"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.25.0"
    }
  }
  cloud {
    organization = "NoxianNet"
    workspaces {
      name = "terraform"
    }
  }
}

provider "cloudflare" {
  email   = var.CF_EMAIL
  api_key = var.CF_API_KEY
}

