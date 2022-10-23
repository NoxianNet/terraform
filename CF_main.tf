resource "cloudflare_zone" "signalproxy_net" {
  zone = "signalproxy.net"
  plan = "free"
  lifecycle {
	prevent_destroy = true
  }
}

resource "cloudflare_record" "docker-instance-subdomains" {
  for_each = var.docker-instance-subdomains
  name     = each.value
  type     = "A"
  zone_id  = cloudflare_zone.signalproxy_net.id
  ttl      = 60
  value    = linode_instance.reverse_proxy_docker.ip_address
}

resource "cloudflare_record" "main_domain" {
  name    = "signalproxy.net"
  type    = "A"
  zone_id = cloudflare_zone.signalproxy_net.id
  value   = linode_instance.reverse_proxy_docker.ip_address
  ttl     = 60
}