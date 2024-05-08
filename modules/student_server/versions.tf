terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.39.0"
    }
    gandi = {
      version = "~> 2.3.0"
      source  = "go-gandi/gandi"
    }
  }
}
