# Creating Network
resource "openstack_networking_network_v2" "test-network" {
  name                    = var.network_info.name
  availability_zone_hints = var.network_info.availability_zone_hints
  external                = var.network_info.external
  shared                  = var.network_info.shared
  admin_state_up          = var.network_info.admin_state_up
}

# Creating Subnet
resource "openstack_networking_subnet_v2" "test-subnet" {
  name            = var.subnet_info.name
  network_id      = "${openstack_networking_network_v2.test-network.id}"
  cidr            = var.subnet_info.cidr
  ip_version      = var.subnet_info.ip_version
  gateway_ip      = var.subnet_info.gateway_ip
  dns_nameservers = var.subnet_info.dns_nameservers
  allocation_pool {
    start = var.subnet_info.allocation_pool.start
    end   = var.subnet_info.allocation_pool.end
  }
  depends_on = [ openstack_networking_network_v2.test-network ]
}