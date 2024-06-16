data "digitalocean_ssh_key" "terraform" {
  name = "hexlet-vm"
}

resource "local_file" "inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<-EOT
[droplets]
${join("\n", [for instance in digitalocean_droplet.web : "${instance.name} ansible_host=${instance.ipv4_address} ansible_user=root"])}
  EOT
}

