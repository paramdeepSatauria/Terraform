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
variable "admin_info" {
  type = object({
    auth_url    = string
    user_name = string
    password = string
    tenant_name = string
    user_domain_name = string
  })
  sensitive = true
}

provider "openstack" {
  auth_url    = var.admin_info.auth_url
  user_name   = var.admin_info.user_name
  password    = var.admin_info.password
  tenant_name = var.admin_info.tenant_name
  user_domain_name = var.admin_info.user_domain_name
}

# Creating Host Aggregates
variable "aggregate_info" {
  type = object({
    name = string
    zone = string
    hosts = list(string)
  })
}

resource "openstack_compute_aggregate_v2" "test-servers" {
  name   = var.aggregate_info.name
  zone   = var.aggregate_info.zone
  hosts  = var.aggregate_info.hosts
}

# Creating Flavors
variable "flavor_info" {
  type = object({
    name =string
    ram = string
    vcpus = string
    disk = string
  })
}

resource "openstack_compute_flavor_v2" "test-flavor" {
  name  = var.flavor_info.name
  ram   = var.flavor_info.ram
  vcpus = var.flavor_info.vcpus
  disk  = var.flavor_info.disk
}

# Creating Image
variable "image_info" {
  type = object({
    name             = string    
    image_source_url = string  
    container_format = string  
    disk_format      = string  
  })
}

resource "openstack_images_image_v2" "test-cirros" {
  name             = var.image_info.name
  image_source_url = var.image_info.image_source_url
  container_format = var.image_info.container_format
  disk_format      = var.image_info.disk_format
}

#Creating Network
resource "openstack_networking_network_v2" "test-network" {
  name           = "provider"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "test-subnet" {
  name       = "provider-sub"
  network_id = openstack_networking_network_v2.test-network.id
  cidr       = "10.253.0.0/16"
  ip_version = 4
  allocation_pool = {
    end = 
    start = 
  }
}