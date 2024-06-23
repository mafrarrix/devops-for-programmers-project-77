resource "digitalocean_loadbalancer" "lb" {
  name   = "example-lb"
  region = "fra1"

  forwarding_rule {
    entry_port     = 8080
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

resource "digitalocean_domain" "domain" {
  name = "mafrarrix.shop"
}

resource "digitalocean_record" "lb_dns" {
  count = 2
  domain = digitalocean_domain.domain.name
  type   = "A"
  name   = "web-${count.index}"
  value = digitalocean_loadbalancer.lb.ip
}