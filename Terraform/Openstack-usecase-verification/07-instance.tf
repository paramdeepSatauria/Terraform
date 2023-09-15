# Creating Instance
resource "openstack_compute_instance_v2" "test-instance" {
  name              = var.instance_info.name
  image_id          = "${openstack_images_image_v2.test-image.id}"
  flavor_id         = "${openstack_compute_flavor_v2.test-flavor.id}"
  availability_zone = "${openstack_compute_aggregate_v2.test-aggregate.name}"
  security_groups   = ["${openstack_networking_secgroup_v2.test-secgroup.name}"]
  network {
    name = "${openstack_networking_network_v2.test-network.name}"
  }
  depends_on = [ openstack_compute_flavor_v2.test-flavor, 
  openstack_compute_aggregate_v2.test-aggregate, 
  openstack_images_image_v2.test-image, 
  openstack_networking_network_v2.test-network,
  openstack_networking_secgroup_v2.test-secgroup]
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.test-instance.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.test-volume.id}"
  depends_on = [   openstack_blockstorage_volume_v2.test-volume ]
}
