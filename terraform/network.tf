# Creazione del bilanciatore di carico Scaleway
resource "scaleway_lb_ip" "main" {
  zone = "fr-par-2"
}

resource "scaleway_lb" "base" {
  ip_ids = [scaleway_lb_ip.main.id]
  zone   = scaleway_lb_ip.main.zone
  type   = "LB-S"
}

# Chi riceverà il traffico
resource "scaleway_lb_backend" "backend01" {
  lb_id            = scaleway_lb.base.id
  name             = "backend01"
  forward_protocol = "http"
  forward_port     = "8080"
  
}

# Punto di esposizione per l'accettazione del traffico
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
