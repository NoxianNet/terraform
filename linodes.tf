resource "linode_sshkey" "public_key" {
  label   = "Public git key"
  ssh_key = chomp(file("id_ed25519.pub"))
}

resource "linode_instance" "udemy_instance" {
  region          = var.default_region
  label           = "udemy-course"
  tags            = ["udemy", "learning"]
  type            = var.linode_sLarge
  authorized_keys = [linode_sshkey.public_key.ssh_key]
  image           = var.linode_ubuntu_22-04
  root_pass       = var.ROOT_PASSWORD
}

resource "linode_volume" "udemy_volume" {
  label     = "udemy_volume"
  region    = var.default_region
  size      = 40
  linode_id = linode_instance.udemy_instance.id
}

#resource "linode_instance" "docker_swarm_manager" {
#  region          = var.default_region
#  label           = "docker-swarm-manager"
#  tags            = concat(var.docker_swarm_tags, var.docker_swarm_manager_tag)
#  type            = var.linode_medium
#  authorized_keys = [ linode_sshkey.public_key.ssh_key ]
#  image           = var.linode_ubuntu_22-04
#  root_pass       = var.ROOT_PASSWORD
#}
#
#resource "linode_instance" "docker_swarm_workers" {
#  count           = 3
#  region          = var.default_region
#  label           = "docker-${count.index + 1}"
#  tags            = var.docker_swarm_tags
#  type            = var.linode_medium
#  authorized_keys = [ linode_sshkey.public_key.ssh_key ]
#  image           = var.linode_ubuntu_22-04
#  root_pass       = var.ROOT_PASSWORD
#}