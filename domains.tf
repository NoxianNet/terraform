resource "linode_domain" "signalproxy_master" {
  type      = "master"
  domain    = "signalproxy.net"
  soa_email = "linode1@noxian.net"
  tags      = [ "main" ]
}

#locals {
#  reverse_proxy_ip = linode_instance.reverse_proxy_docker.ip_address
#}
#
#resource "linode_domain_record" "portainer_subdomain" {
#  domain_id   = linode_domain.signalproxy_master.id
#  record_type = "A"
#  target      = local.reverse_proxy_ip
#  name        = "portainer"
#}
#
#resource "linode_domain_record" "code_subdomain" {
#  domain_id   = linode_domain.signalproxy_master.id
#  record_type = "A"
#  target      = local.reverse_proxy_ip
#  name        = "code"
#}
#
#resource "linode_domain_record" "npm_subdomain" {
#  domain_id   = linode_domain.signalproxy_master.id
#  record_type = "A"
#  target      = local.reverse_proxy_ip
#  name        = "npm"
#}