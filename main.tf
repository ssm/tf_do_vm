resource "digitalocean_droplet" "node" {
  image    = var.image
  ipv6     = var.ipv6
  name     = var.name
  vpc_uuid = var.vpc_uuid
  region   = var.region
  size     = var.size
  ssh_keys = var.ssh_keys
}

resource "digitalocean_record" "ipv4" {
  domain = var.domain
  name   = digitalocean_droplet.node.name
  ttl    = var.dns_ttl
  type   = "A"
  value  = digitalocean_droplet.node.ipv4_address
}

resource "digitalocean_record" "ipv6" {
  domain = var.domain
  name   = digitalocean_droplet.node.name
  ttl    = var.dns_ttl
  type   = "AAAA"
  value  = digitalocean_droplet.node.ipv6_address
  count  = var.ipv6 == true ? 1 : 0
}

resource "digitalocean_record" "cname" {
  for_each = toset(var.dns_cnames)

  domain = var.domain
  name   = each.value
  ttl    = var.dns_ttl
  type   = "CNAME"
  value  = "${digitalocean_droplet.node.name}.${var.domain}."
}
