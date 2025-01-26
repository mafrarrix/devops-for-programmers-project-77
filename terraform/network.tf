resource "scaleway_vpc_private_network" "shared_vpc" {
  name = "shared-vpc-network"
  ipv4_subnet {
    subnet = "192.168.0.0/28"
  }
}

# Creazione del bilanciatore di carico Scaleway
resource "scaleway_lb_ip" "main" {
  zone = "fr-par-2"
}

resource "scaleway_lb" "base" {
  ip_ids = [scaleway_lb_ip.main.id]
  zone   = scaleway_lb_ip.main.zone
  type   = "LB-S"
}

# servers dove atterrano le connesioni che passano attraverso il bilanciatore
resource "scaleway_lb_backend" "backend01" {
  lb_id            = scaleway_lb.base.id
  name             = "backend01"
  forward_protocol = "http"
  forward_port     = "8080"

  # Inserire il fatto che punta aun tag di istanze
  server_ips = [
    for instance in scaleway_instance_server.web : instance.public_ip
  ]

}

# Punto di esposizione per l'accettazione del traffico
resource "scaleway_lb_frontend" "frontend01" {
  lb_id        = scaleway_lb.base.id
  backend_id   = scaleway_lb_backend.backend01.id
  name         = "frontend01"
  inbound_port = "80"
}


# Binding delle connessioni
resource "scaleway_lb_route" "rt01" {
  frontend_id       = scaleway_lb_frontend.frontend01.id
  backend_id        = scaleway_lb_backend.backend01.id
  match_host_header = "mafrarrix.shop"
}
