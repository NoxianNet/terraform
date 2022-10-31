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

variable "ROOT_PASSWORD" {
  type      = string
  sensitive = true
}

variable "linode_ubuntu_22-04" {
  type    = string
  default = "linode/ubuntu22.04"
}

variable "firewall_label" {
  description = "This firewall's human-readable firewall_label"
  type        = string
  default     = "default-firewall-rules"
}

variable "default_http_ssh_tags" {
  description = "List of tags to apply to this Firewall"
  type        = list(string)
  default     = [ "accept-http", "accept-https", "port-81", "ssh" ]
}

variable "ip4_addresses" {
  description = "A list of IP addresses, CIDR blocks, or 0.0.0.0/0 (to allow all) this rule applies to."
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
}

# https://api.linode.com/v4/linode/types
variable "linode_large" {
  description = "Provision a linode instance as a g6-standard-2"
  type        = string
  default     = "g6-standard-2"
}

variable "linode_medium" {
  description = "Provision a linode instance as a g6-standard-1"
  type        = string
  default     = "g6-standard-1"
}
variable "linode_small" {
  description = "provision a linode instance as a g6-nanode-1"
  type        = string
  default     = "g6-nanode-1"
}

variable "docker_swarm_tags" {
  description = "default tags to assign to docker swarm"
  type        = list(string)
  default     = [ "docker", "docker-swarm" ]
}

variable "docker_swarm_manager_tag" {
  description = "default tags to assign to docker swarm manager"
  type        = list(string)
  default     = [ "docker-swarm-manager", "manager" ]
}


#variable "docker-instance-subdomains" {
#  type    = set(string)
#  default = [
#	"code", "code-server", "vscode",
#	"nginx", "portainer", "test",
#	"ssh", "docker", "grafana",
#	"graylog", "influx", "admin",
#	"proxy-manager"
#  ]
#}
