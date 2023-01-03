resource "cloudflare_zone" "signalproxy_net" {
  zone = "signalproxy.net"
  plan = "free"
}

resource "cloudflare_record" "udemy_subdomain" {
  name       = "vps"
  type       = "A"
  zone_id    = cloudflare_zone.signalproxy_net.id
  value      = linode_instance.udemy_instance.ip_address
  ttl        = 60
  depends_on = [linode_instance.udemy_instance]
}

resource "cloudflare_record" "main" {
  name    = "@"
  type    = "A"
  zone_id = cloudflare_zone.signalproxy_net.id
  value   = linode_instance.udemy_instance.ip_address
  ttl     = 60
}


#resource "cloudflare_record" "main_domain" {
#  name       = "@"
#  type       = "A"
#  zone_id    = cloudflare_zone.signalproxy_net.id
#  value      = linode_instance.docker_swarm_manager.ip_address
#  ttl        = 60
#  depends_on = [linode_instance.docker_swarm_manager]
#}

#resource "cloudflare_record" "docker_swarm" {
#  count      = 3
#  name       = "docker${count.index + 1}"
#  type       = "A"
#  zone_id    = cloudflare_zone.signalproxy_net.id
#  value      = linode_instance.docker_swarm_workers[ count.index ].ip_address
#  ttl        = 60
#  depends_on = [ linode_instance.docker_swarm_workers ]
#}
#
#resource "cloudflare_record" "docker_swarm-manager" {
#  name       = "docker"
#  type       = "A"
#  zone_id    = cloudflare_zone.signalproxy_net.id
#  value      = linode_instance.docker_swarm_manager.ip_address
#  ttl        = 60
#  depends_on = [ linode_instance.docker_swarm_manager ]
#}