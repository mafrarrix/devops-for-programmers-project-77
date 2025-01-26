resource "scaleway_instance_ip" "web_ip" {
  count = 2
  zone  = "fr-par-2"
}

resource "scaleway_instance_server" "web" {
  count     = 2
  name      = "web-${count.index + 1}"
  type      = "DEV1-S"
  image     = "ubuntu_jammy"
  zone      = "fr-par-2"
  tags      = ["terraform instance"]
  user_data = var.user_data
  ip_id     = scaleway_instance_ip.web_ip[count.index].id


  # Collegare il server web alla Private Network appropriata
  private_network {
    pn_id = scaleway_vpc_private_network.shared_vpc.id
  }


  provisioner "remote-exec" {
    inline = [
      "echo '${var.public_key}' >> /root/.ssh/authorized_keys",
      "chmod 600 /root/.ssh/authorized_keys",
      "echo 'Public key added successfully to /root/.ssh/authorized_keys'"
    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
      host        = scaleway_instance_ip.web_ip[count.index].address
    }
  }

}







