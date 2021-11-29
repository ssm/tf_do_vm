variable "name" {
  type        = string
  description = "Name of the virtual machine, without domain."
}

variable "domain" {
  type        = string
  description = "The domain name to use"
}

variable "image" {
  type        = string
  description = "The Digital Ocean image to use"
}

variable "region" {
  type        = string
  description = "The Digital Ocean region / datacenter"
  default     = "fra1"
}

variable "size" {
  type        = string
  description = "Size of the Digital Ocean instance"
  default     = "s-1vcpu-1gb"
}

variable "ssh_keys" {
  description = "SSH keys for provisioning"
  type        = list(string)
}

variable "ipv6" {
  type        = bool
  description = "Enable IPv6"
  default     = true
}

variable "dns_cnames" {
  description = "A list of DNS CNAMEs within the same domain for this node"
  type        = list(string)
  default     = []
}

variable "dns_ttl" {
  type        = number
  description = "TTL for DNS records"
  default     = 60
}

variable "vpc_uuid" {
  type        = string
  description = "Virtual Private Cloud (VPC) network"
  default     = null
}
