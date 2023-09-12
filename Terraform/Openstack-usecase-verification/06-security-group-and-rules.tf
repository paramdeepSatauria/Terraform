# Creating Security Group and Rule's
resource "openstack_networking_secgroup_v2" "test-secgroup" {
  name        = var.secgroup_info.name
  description = var.secgroup_info.description
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_1" {
  direction         = var.secgroup_info.rule1.direction
  ethertype         = var.secgroup_info.rule1.ethertype
  protocol          = var.secgroup_info.rule1.protocol
  port_range_min    = var.secgroup_info.rule1.port_range_min
  port_range_max    = var.secgroup_info.rule1.port_range_max
  remote_ip_prefix  = var.secgroup_info.rule1.remote_ip_prefix
  security_group_id = "${openstack_networking_secgroup_v2.test-secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_2" {
  direction         = var.secgroup_info.rule2.direction
  ethertype         = var.secgroup_info.rule2.ethertype
  port_range_min    = var.secgroup_info.rule2.port_range_min
  port_range_max    = var.secgroup_info.rule2.port_range_max
  protocol          = var.secgroup_info.rule2.protocol
  remote_ip_prefix  = var.secgroup_info.rule2.remote_ip_prefix
  security_group_id = "${openstack_networking_secgroup_v2.test-secgroup.id}"
}