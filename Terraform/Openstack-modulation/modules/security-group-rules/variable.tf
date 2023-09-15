variable "secgroup_info" {
  type = object({
    name = string
    description = string
    rule1 = object({
      direction         = string
      ethertype         = string
      protocol          = string
      port_range_min    = number
      port_range_max    = number
      remote_ip_prefix  = string
    })
    rule2 = object({
      direction         = string
      ethertype         = string
      protocol          = string
      remote_ip_prefix  = string
    })
  })
  default = {
    name = "test-secgroup"
    description = "Test Security Group"
    rule1 = {
      direction = "ingress"
      ethertype = "IPv4"
      protocol = "tcp"
      port_range_min = 22
      port_range_max = 22
      remote_ip_prefix = "0.0.0.0/0"
    }
    rule2 = {
      direction = "ingress"
      ethertype = "IPv4"
      protocol = "icmp"
      remote_ip_prefix = "0.0.0.0/0"
    }
  }
}