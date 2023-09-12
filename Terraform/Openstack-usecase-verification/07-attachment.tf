# # attachement
# resource "openstack_compute_volume_attach_v2" "test-attached" {
#   instance_id = "${openstack_compute_instance_v2.test-instance.id}"
#   volume_id   = "${openstack_blockstorage_volume_v2.test-volume.id}"
#   depends_on = [ openstack_blockstorage_volume_v2.test-volume ]
# }