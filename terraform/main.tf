data "digitalocean_droplet_snapshot" "ubuntu" {
  name = "ubuntu-22.04-01-12-2022"
}

data "digitalocean_ssh_key" "main" {
  name = "[work-pc] Romanow"
}

locals {
  tags = [
    ["postgres", "master"],
    ["postgres", "slaves"],
    ["pgpool"]
  ]
}

resource "digitalocean_droplet" "vm" {
  count    = 3
  image    = data.digitalocean_droplet_snapshot.ubuntu.id
  name     = "vm-${var.names[count.index]}"
  region   = var.vm_region
  size     = var.vm_size
  ssh_keys = [data.digitalocean_ssh_key.main.fingerprint]
  tags     = concat(local.tags[count.index], ["ansible", "database"])
}

resource "digitalocean_record" "vm-a-record" {
  count  = 3
  name   = var.names[count.index]
  domain = var.domain
  type   = "A"
  ttl    = 300
  value  = element(digitalocean_droplet.vm.*.ipv4_address, count.index)
}