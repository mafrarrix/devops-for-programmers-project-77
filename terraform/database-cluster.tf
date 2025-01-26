
resource "scaleway_rdb_instance" "main" {
  name               = "test-rdb"
  node_type          = "DB-DEV-S"
  engine             = "PostgreSQL-15"
  is_ha_cluster      = false
  disable_backup     = true
  user_name          = "my_initial_user"
  password           = "thiZ_is_v&ry_s3cret"
  encryption_at_rest = true
  region             = "fr-par"

  private_network {
    pn_id  = scaleway_vpc_private_network.shared_vpc.id
    ip_net = "192.168.0.10/28"

  }

}
