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

# Creating Host Aggregates
resource "openstack_compute_aggregate_v2" "test-aggregate" {
  name   = var.aggregate_info.name
  zone   = var.aggregate_info.zone
  hosts  = var.aggregate_info.hosts
}