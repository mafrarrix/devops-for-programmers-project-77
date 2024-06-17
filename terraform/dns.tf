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