output "urn" {
  value = digitalocean_droplet.node.urn
}
output "fqdn" {
  value = "${var.name}.${var.domain}"
}
