output "network_name" {
  value       = "${openstack_networking_network_v2.test-network.name}"
  description = "network name of the network created"
}