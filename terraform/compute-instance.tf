resource "digitalocean_droplet" "web" {
  count  = 2
  name   = "web-${count.index + 1}"
  image  = "ubuntu-20-04-x64"
  region = "fra1"
  size   = "s-2vcpu-2gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }

/*   provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
       "sudo apt update"
    ]
  } */
}


