resource "linode_firewall" "default_firewall_rules" {
  label = var.firewall_label
  tags  = var.default_http_ssh_tags

  inbound {
    label    = "allow-ssh"
    protocol = "TCP"
    ports    = "22"
    action   = "ACCEPT"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "allow-http"
    protocol = "TCP"
    ports    = "80"
    action   = "ACCEPT"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "allow-nginx-admin"
    protocol = "TCP"
    ports    = "81"
    action   = "ACCEPT"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "allow-https"
    protocol = "TCP"
    ports    = "443"
    action   = "ACCEPT"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "allow-influx-db"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "8086"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "allow-graylog"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "1514"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "cluster-communications"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "2377"
    ipv4     = var.ip4_addresses
  }

  inbound {
    label    = "communications-among-nodes-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "7946"
    ipv4     = var.ip4_addresses
  }

  inbound {
    action   = "ACCEPT"
    label    = "communications-among-nodes-udp"
    protocol = "UDP"
    ports    = "7946"
    ipv4     = var.ip4_addresses
  }

  inbound {
    action   = "ACCEPT"
    label    = "overlay-network-traffic"
    protocol = "UDP"
    ports    = "4789"
    ipv4     = var.ip4_addresses
  }

  inbound_policy  = "ACCEPT"
  outbound_policy = "ACCEPT"

  linodes = [
    #	linode_instance.docker_swarm_manager.id,
    #	linode_instance.docker_swarm_workers[ 0 ].id,
    #	linode_instance.docker_swarm_workers[ 1 ].id,
    #	linode_instance.docker_swarm_workers[ 2 ].id
  ]

  #  depends_on = [ linode_instance.docker_swarm_manager, linode_instance.docker_swarm_workers ]
}