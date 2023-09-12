# Creating Flavors
resource "openstack_compute_flavor_v2" "test-flavor" {
  name  = var.flavor_info.name
  ram   = var.flavor_info.ram
  vcpus = var.flavor_info.vcpus
  disk  = var.flavor_info.disk
}