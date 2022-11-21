output "instance_ip_address" {
  value       = digitalocean_droplet.vm.*.ipv4_address
  description = "VM ip addresses"
}