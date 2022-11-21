data "digitalocean_image" "ubuntu" {
  name = "ansible-box-ubuntu-2204"
}

resource "digitalocean_droplet" "vm" {
  count  = 3
  image  = data.digitalocean_image.ubuntu.id
  name   = "vm-${var.names[count.index]}"
  region = var.vm_region
  size   = var.vm_size
  tags   = concat(var.vm_tags, [var.names[count.index]])
}

resource "digitalocean_record" "vm-a-record" {
  count  = 3
  name   = var.names[count.index]
  domain = var.domain
  type   = "A"
  ttl    = 300
  value  = element(digitalocean_droplet.vm.*.ipv4_address, count.index)
}