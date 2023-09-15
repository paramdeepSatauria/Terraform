# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}

# Creating Volumes
resource "openstack_blockstorage_volume_v2" "test-volume" {
  name              = var.volume_info.name
  availability_zone = var.volume_info.availability_zone
  size              = var.volume_info.size
  description       = var.volume_info.description
}