resource "linode_instance" "reverse_proxy_docker" {
  region          = var.default_region
  label           = "nginx-docker"
  tags            = [ "docker", "nginx", "reverse-proxy" ]
  type            = "g6-standard-1"
  authorized_keys = [ var.ssh_key ]
  image           = "linode/ubuntu22.04"
}