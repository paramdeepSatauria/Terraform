output "secgroup-name" {
  value       = "${openstack_networking_secgroup_v2.test-secgroup.name}"
  description = "secgroup name of the secgroup created"
}