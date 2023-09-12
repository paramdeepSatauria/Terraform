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
  auth_url    = var.admin_info.auth_url
  user_name   = var.admin_info.user_name
  password    = var.admin_info.password
  tenant_name = var.admin_info.tenant_name
  user_domain_name = var.admin_info.user_domain_name
}