/* data "digitalocean_ssh_key" "terraform" {
  name = "hexlet-vm"
}

resource "local_file" "inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<-EOT
[webservers]
${join("\n", [for instance in digitalocean_droplet.web : "${instance.name} ansible_host=${instance.ipv4_address} ansible_user=root"])}
  EOT
} */

/* data "scaleway_account_ssh_key" "my_key" {
  name  = "hexlet-vm"
} */


data "scaleway_instance_servers" "hexlet_instance" {
  tags  = ["hexlet"]
}

resource "local_file" "inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<-EOT
[webservers]
${join("\n", [for instance in data.scaleway_instance_servers.hexlet_instance.servers : "${instance.name} ansible_host=${instance.public_ip} ansible_user=root"])}
  EOT
}