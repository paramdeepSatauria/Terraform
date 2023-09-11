# Defining variables
variable "admin_info" {
  type = object({
    user_name = string
    password = string
    auth_url    = string
    domain_name  = string
  })
  sensitive = true
}

variable "flavor_info" {
  type = object({
    name =string
    ram = string
    vcpus = string
    disk = string
  })
}


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

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.admin_info.user_name
  password    = var.admin_info.password
  auth_url    = var.admin_info.auth_url
  domain_name  = var.admin_info.domain_name
}

# Creating Flavors
resource "openstack_compute_flavor_v2" "test-flavor" {
  name  = var.flavor_info.name
  ram   = var.flavor_info.ram
  vcpus = var.flavor_info.vcpus
  disk  = var.flavor_info.disk
  domain_name  = var.admin_info.domain_name
}
