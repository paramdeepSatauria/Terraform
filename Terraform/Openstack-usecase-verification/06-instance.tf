# Creating Instance
resource "openstack_compute_instance_v2" "test-instance" {
  name              = var.instance_info.name
  image_id          = "${openstack_images_image_v2.test-image.id}"
  flavor_id         = "${openstack_compute_flavor_v2.test-flavor.id}"
  availability_zone = "${openstack_compute_aggregate_v2.test-aggregate.name}"
  security_groups   = ["default"]
  network {
    name = "${openstack_networking_network_v2.test-network.name}"
  }
  volume {
    volume_id   = "${openstack_blockstorage_volume_v2.test-volume.id}"
  }
  depends_on = [ openstack_compute_flavor_v2.test-flavor, 
  openstack_compute_aggregate_v2.test-aggregate, 
  openstack_images_image_v2.test-image, 
  openstack_networking_network_v2.test-network,
  openstack_blockstorage_volume_v2.test-volume]
}