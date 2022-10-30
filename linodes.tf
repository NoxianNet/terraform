resource "linode_instance" "reverse_proxy_docker" {
  region          = var.default_region
  label           = "nginx-docker"
  tags            = [ "docker", "nginx", "reverse-proxy" ]
  type            = var.linode_large
  authorized_keys = [ var.ssh_key ]
  image           = var.linode_ubuntu_image
}

resource "linode_instance" "stackscript_test" {
  region          = var.default_region
  label           = "test-stackscript"
  tags            = [ "test", "stackscript" ]
  type            = var.linode_small
  authorized_keys = [ var.ssh_key ]
  image           = var.linode_ubuntu_image

  stackscript_id = linode_stackscript.install_docker.id
}