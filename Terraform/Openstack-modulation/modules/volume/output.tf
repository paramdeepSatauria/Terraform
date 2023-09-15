output "volume_id" {
  value       = "${openstack_blockstorage_volume_v2.test-volume.id}"
  description = "volume id of the volume created"
}