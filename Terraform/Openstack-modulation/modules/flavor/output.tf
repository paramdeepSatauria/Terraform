output "flavor_id" {
  value       = "${openstack_compute_flavor_v2.test-flavor.id}"
  description = "flavor id of the flavor created"
}