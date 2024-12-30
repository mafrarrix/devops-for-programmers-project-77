resource "scaleway_instance_ip" "web_ip" {
  count     = 2
 #server_id = scaleway_instance_server.web[count.index].id
  #type = "dynamic" 
  zone  = "fr-par-2"
}

resource "scaleway_instance_server" "web" {
  count     = 2
  name      = "web-${count.index + 1}"
  type      = "DEV1-S"
  image     = "ubuntu_focal"
  zone      = "fr-par-2"
  tags      = ["terraform instance"]
  user_data = var.user_data
  ip_id     = scaleway_instance_ip.web_ip[count.index].id
  

/*   provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt update"
    ]

    connection {
      host        = scaleway_instance_server.web[count.index].private_ip
      user        = "root"
      type        = "ssh"
      private_key = file(var.pvt_key)
      timeout     = "2m"

    }
  } */
}







