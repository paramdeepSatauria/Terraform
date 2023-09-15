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
  auth_url         = var.admin_info.auth_url
  user_name        = var.admin_info.user_name
  password         = var.admin_info.password
  tenant_name      = var.admin_info.tenant_name
  user_domain_name = var.admin_info.user_domain_name
}

# importing module contaning host-aggregator info
module "host-aggregator" {
  source = "../modules/host-aggregator"
}

# importing module contaning flavor info
module "flavor" {
  source = "../modules/flavor"
}

# importing module contaning image info
module "image" {
  source = "../modules/image"
}

# importing module contaning network info
module "network" {
  source = "../modules/network"
}

# importing module contaning volume info
module "volume" {
  source = "../modules/volume"
}

# importing module contaning secgroup info
module "secgroup" {
  source = "../modules/security-group-rules"
}

# Creating Instance
resource "openstack_compute_instance_v2" "test-instance" {
  name              = var.instance_info.name
  image_id          = module.image.image_id
  flavor_id         = module.flavor.flavor_id
  availability_zone = module.host-aggregator.host-aggregate_name
  security_groups   = ["${module.secgroup.secgroup-name}"]
  network {
    name = module.network.network_name
  }
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.test-instance.id}"
  volume_id   = module.volume.volume_id
}
