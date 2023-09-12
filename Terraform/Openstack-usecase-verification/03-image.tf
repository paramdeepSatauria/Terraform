# Creating Image
resource "openstack_images_image_v2" "test-image" {
  name             = var.image_info.name
  image_source_url = var.image_info.image_source_url
  container_format = var.image_info.container_format
  disk_format      = var.image_info.disk_format
}