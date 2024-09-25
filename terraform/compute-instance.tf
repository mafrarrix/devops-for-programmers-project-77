/* resource "digitalocean_droplet" "web" {
  count  = 2
  name   = "web-${count.index + 1}"
  image  = "ubuntu-20-04-x64"
  region = "fra1"
  size   = "s-2vcpu-2gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
       "sudo apt update"
    ]
  }
} */

resource "scaleway_instance_server" "web" {
  count = 2
  name  = "web-${count.index + 1}"
  type  = "DEV1-S"
  image = "ubuntu_focal"
  zone = "fr-par-2"
  tags = [ "hexlet" ]
/*   user_data = <<-EOF
            #!/bin/bash
            echo ${var.public_key} >> /home/scw-user/.ssh/authorized_keys
            EOF

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt update"
    ]

    connection {
      host        = self.public_ip[0].address 
      user        = "root"
      type        = "ssh"
      private_key = file(var.pvt_key)
      timeout     = "2m"
    }
  } */
}



