locals {
  record_name = "server-of-${lower(var.student_name)}.pxl"
  record_zone = "bjth.xyz"
  fqdn        = "${local.record_name}.${local.record_zone}"
}

resource "hcloud_ssh_key" "ssh_keys" {
  count      = length(var.ssh_keys)
  name       = "SSH Key ${count.index} of ${lower(var.student_name)}"
  public_key = var.ssh_keys[count.index]
}

resource "hcloud_server" "server" {
  name        = "server-of-${lower(var.student_name)}"
  image       = var.image
  server_type = var.server_type
  location    = var.location
  ssh_keys    = concat(resource.hcloud_ssh_key.ssh_keys[*].id, ["key-of-bryan"])
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

resource "gandi_livedns_record" "a_record" {
  name   = local.record_name
  ttl    = 300
  type   = "A"
  values = [resource.hcloud_server.server.ipv4_address]
  zone   = local.record_zone
}

resource "gandi_livedns_record" "aaaa_record" {
  name   = local.record_name
  ttl    = 300
  type   = "AAAA"
  values = [resource.hcloud_server.server.ipv6_address]
  zone   = local.record_zone
}
