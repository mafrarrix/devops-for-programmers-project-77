resource "digitalocean_database_cluster" "postgres-example" {
  name       = "example-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1

}

resource "digitalocean_database_user" "postgres-example" {
  name       = var.db_username
  cluster_id = digitalocean_database_cluster.postgres-example.id
}


