output "instance_ips_debug" {
  value = [
    for instance in scaleway_instance_server.web : {
      name       = instance.name
      id         = instance.id
      public_ip  = instance.public_ip
      private_ip = instance.private_ip
      #status     = instance.status
      type       = instance.type
      zone       = instance.zone
    }
  ]
}

resource "local_file" "inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<-EOT
[webservers]
${join("\n", [for instance in scaleway_instance_server.web : 
    instance.public_ip != "" ? "${instance.name} ansible_host=${instance.public_ip} ansible_user=root" : "null"
])}
  EOT
}
