resource "linode_firewall" "default_firewall_rules" {
  label = var.firewall_label
  tags  = var.default_http_ssh_tags

  inbound {
	label    = "allow-ssh"
	protocol = "TCP"
	ports    = "22"
	action   = "ACCEPT"
	ipv4     = var.ip4_address
  }

  inbound {
	label    = "allow-http"
	protocol = "TCP"
	ports    = "80"
	action   = "ACCEPT"
	ipv4     = var.ip4_address
  }

  inbound {
	label    = "allow-nginx-admin"
	protocol = "TCP"
	ports    = "81"
	action   = "ACCEPT"
	ipv4     = var.ip4_address
  }

  inbound {
	label    = "allow-https"
	protocol = "TCP"
	ports    = "443"
	action   = "ACCEPT"
	ipv4     = var.ip4_address
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  linodes = [ linode_instance.reverse_proxy_docker.id ]
}