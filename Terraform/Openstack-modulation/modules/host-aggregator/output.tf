output "host-aggregate_name" {
  value       = "${openstack_compute_aggregate_v2.test-aggregate.name}"
  description = "host-aggregate name of the host-aggregate created"
}