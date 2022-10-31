resource "linode_instance" "docker_swarm_manager" {
  region          = var.default_region
  label           = "docker-swarm-manager"
  tags            = concat(var.docker_swarm_tags, var.docker_swarm_manager_tag)
  type            = var.linode_medium
  authorized_keys = [ var.ssh_key ]
  image           = var.linode_ubuntu_22-04
  root_pass       = var.ROOT_PASSWORD
  stackscript_id  = linode_stackscript.install_docker.id
}

resource "linode_instance" "docker_swarm_workers" {
  count           = 3
  region          = var.default_region
  label           = "docker-${count.index}"
  tags            = var.docker_swarm_tags
  type            = var.linode_medium
  authorized_keys = [ var.ssh_key ]
  image           = var.linode_ubuntu_22-04
  root_pass       = var.ROOT_PASSWORD
  stackscript_id  = linode_stackscript.install_docker.id
}
