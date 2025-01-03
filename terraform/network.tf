/* resource "digitalocean_loadbalancer" "lb" {
  name   = "example-lb"
  region = "fra1"

  forwarding_rule {
    entry_port     = 8080
    entry_protocol = "http"
    target_port    = 80
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
} */

# Creazione del bilanciatore di carico Scaleway
resource "scaleway_lb_ip" "main" {
  zone = "fr-par-2"
}

resource "scaleway_lb" "base" {
  ip_ids = [scaleway_lb_ip.main.id]
  zone   = scaleway_lb_ip.main.zone
  type   = "LB-S"
}

resource "scaleway_lb_backend" "backend01" {
  lb_id            = scaleway_lb.base.id
  name             = "backend01"
  forward_protocol = "http"
  forward_port     = "8080"
  
}

resource "scaleway_lb_frontend" "frontend01" {
  lb_id        = scaleway_lb.base.id
  backend_id   = scaleway_lb_backend.backend01.id
  name         = "frontend01"
  inbound_port = "80"
}

resource "scaleway_lb_route" "rt01" {
  frontend_id       = scaleway_lb_frontend.frontend01.id
  backend_id        = scaleway_lb_backend.backend01.id
  match_host_header = "mafrarrix.shop"
}
