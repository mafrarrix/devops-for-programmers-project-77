variable "do_token" {
  description = "Digitalocean token"
  type        = string
  sensitive   = true
}

variable "pvt_key" {
  description = "Path private key"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  sensitive   = true
}