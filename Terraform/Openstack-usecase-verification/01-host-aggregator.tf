# Creating Host Aggregates
resource "openstack_compute_aggregate_v2" "test-aggregate" {
  name   = var.aggregate_info.name
  zone   = var.aggregate_info.zone
  hosts  = var.aggregate_info.hosts
}