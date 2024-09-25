/* terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
} 

 provider "digitalocean" {
  token = var.do_token
} */

terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.45.0"
    }
  }
}

provider "scaleway" {
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.organization_id
  project_id      = var.project_id
}