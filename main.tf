resource "cloudflare_zone" "signalproxy_net" {
  zone = "signalproxy.net"
  plan = "free"
}

resource "cloudflare_record" "test-domain" {
  name       = "test"
  type       = "A"
  zone_id    = cloudflare_zone.signalproxy_net.id
  value      = linode_instance.reverse_proxy_docker.ip_address
  ttl        = 60
  depends_on = [
	linode_instance.reverse_proxy_docker
  ]
}