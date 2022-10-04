terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.2"
    }
  }
  cloud {
    organization = "NoxianNet"
    workspaces {
      name = "terraform"
    }
  }
}

