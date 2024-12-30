data "scaleway_instance_servers" "hexlet_instance" {
  tags = ["terraform instance"]
}

output "instance_ips_debug" {
  value = data.scaleway_instance_servers.hexlet_instance.servers  
}

resource "local_file" "inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<-EOT
[webservers]
${join("\n", [for instance in data.scaleway_instance_servers.hexlet_instance.servers : 
    instance.public_ip != "" ? "${instance.name} ansible_host=${instance.public_ip} ansible_user=root" : "porcodio"
])}
  EOT
}
