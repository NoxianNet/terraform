resource "linode_stackscript" "install_docker" {
  label       = "install-docker"
  description = "Install docker on linode instance"
  script      = <<EOF
#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
EOF
  images      = [ var.linode_ubuntu_image ]
  rev_note    = "initial version"
}