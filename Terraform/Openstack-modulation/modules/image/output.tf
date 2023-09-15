output "image_id" {
  value       = "${openstack_images_image_v2.test-image.id}"
  description = "image id of the image created"
}