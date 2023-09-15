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

# Creating Flavors
resource "openstack_compute_flavor_v2" "test-flavor" {
  name  = var.flavor_info.name
  ram   = var.flavor_info.ram
  vcpus = var.flavor_info.vcpus
  disk  = var.flavor_info.disk
}