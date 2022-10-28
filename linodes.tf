resource "linode_instance" "reverse_proxy_docker" {
  region          = var.default_region
  label           = "nginx-docker"
  tags            = [ "docker", "nginx", "reverse-proxy" ]
  type            = "g6-standard-2"
  authorized_keys = [ var.ssh_key ]
  image           = var.linode_ubuntu_image
}