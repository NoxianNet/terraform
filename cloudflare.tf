resource "cloudflare_zone" "signalproxy_net" {
  zone = "signalproxy.net"
  plan = "free"
}

resource "cloudflare_record" "main_domain" {
  name       = "@"
  type       = "A"
  zone_id    = cloudflare_zone.signalproxy_net.id
  value      = linode_instance.docker_swarm_manager.ip_address
  ttl        = 60
  depends_on = [ linode_instance.docker_swarm_manager ]
}

resource "cloudflare_record" "docker_swarm" {
  count      = 3
  name       = "docker${count.index}"
  type       = "A"
  zone_id    = cloudflare_zone.signalproxy_net.id
  value      = linode_instance.docker_swarm_workers[ count.index ].ip_address
  depends_on = [ linode_instance.docker_swarm_workers ]
}
#resource "cloudflare_record" "docker_1-instance-subdomains" {
#  for_each = var.docker-instance-subdomains
#  name     = each.value
#  type     = "A"
#  zone_id  = cloudflare_zone.signalproxy_net.id
#  ttl      = 60
#  value    = linode_instance.docker_1.ip_address
#}


#resource "cloudflare_record" "docker_1_main" {
#  name    = "docker1"
#  type    = "A"
#  zone_id = cloudflare_zone.signalproxy_net.id
#  value   = linode_instance.docker_1.ip_address
#  ttl     = 60
#}

#resource "cloudflare_record" "docker_2_main" {
#  name    = "docker2"
#  type    = "A"
#  zone_id = cloudflare_zone.signalproxy_net.id
#  value   = linode_instance.docker_2.ip_address
#  ttl     = 60
#}