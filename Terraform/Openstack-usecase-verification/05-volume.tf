# Creating Volumes
resource "openstack_blockstorage_volume_v2" "test-volume" {
  name              = var.volume_info.name
  availability_zone = var.volume_info.availability_zone
  size              = var.volume_info.size
  description       = var.volume_info.description
}