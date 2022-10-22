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
  proxied  = true
}