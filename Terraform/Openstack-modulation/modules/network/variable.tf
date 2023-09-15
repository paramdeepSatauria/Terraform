variable "network_info" {
  type = object({
    name                    = string
    availability_zone_hints = list(string)
    external                = bool
    shared                  = bool
    admin_state_up          = bool 
  })
  default = {
    name = "provider"
    availability_zone_hints = ["nova"]
    external = true
    shared = true
    admin_state_up = true
  }
}

variable "subnet_info" {
  type = object({
    name            = string
    cidr            = string
    ip_version      = number
    gateway_ip      = string
    dns_nameservers = list(string)
    allocation_pool = object({
      start = string
      end   = string
    })
  })
  default = {
    name = "provider-sub"
    cidr = "10.253.0.0/16"
    ip_version = 4
    gateway_ip = "10.253.0.1"
    dns_nameservers = ["10.254.4.10"]
    allocation_pool = {
      start = "10.253.15.180"
      end = "10.253.15.190"
    }
  }
}