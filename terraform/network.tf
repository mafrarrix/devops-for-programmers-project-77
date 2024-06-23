resource "digitalocean_loadbalancer" "lb" {
  name   = "example-lb"
  region = "fra1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"
    target_port    = 8080
    target_protocol = "http"
  }

  healthcheck {
    port     = 8080
    protocol = "http"
    path     = "/"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}