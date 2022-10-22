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
	"ssh", "docker"
  ]
}