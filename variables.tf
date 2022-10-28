variable "LINODE_TOKEN" {
  type      = string
  sensitive = true
}

variable "default_region" {}

variable "ssh_key" {}

variable "CF_EMAIL" {
  type      = string
  sensitive = true
}

variable "CF_API_KEY" {
  type      = string
  sensitive = true
}

variable "docker-instance-subdomains" {
  type    = set(string)
  default = [
	"code", "code-server", "vscode",
	"nginx", "portainer", "test",
	"ssh", "docker", "grafana",
	"graylog", "influx", "admin",
	"proxy-manager"
  ]
}

variable "linode_ubuntu_image" {
  type    = string
  default = "linode/ubuntu22.04"
}

variable "firewall_label" {
  description = "This firewall's human-readable firewall_label"
  type        = string
  default     = "default-firewall-rules"
}

#variable "linodes" {
#  description = "List of Linode ids to which the rule sets will be applied"
#  type        = list(string)
#  default     = [ linode_instance.reverse_proxy_docker.id ]
#}

variable "default_http_ssh_tags" {
  description = "List of tags to apply to this Firewall"
  type        = list(string)
  default     = [ "accept-http", "accept-https", "port-81", "ssh" ]
}

variable "ip4_address" {
  description = "A list of IP addresses, CIDR blocks, or 0.0.0.0/0 (to allow all) this rule applies to."
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
}