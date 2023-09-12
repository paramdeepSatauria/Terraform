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

variable "aggregate_info" {
  type = object({
    name = string
    zone = string
    hosts = list(string)
  })
}

variable "volume_info" {
  type = object({
    name              = string
    availability_zone = string
    size              = number
    description       = string
  })
}

variable "instance_info" {
  type = object({
    name              = string
  })
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
}

variable "network_info" {
  type = object({
    name                    = string
    availability_zone_hints = list(string)
    external                = bool
    shared                  = bool
    admin_state_up          = bool 
  })
}

variable "image_info" {
  type = object({
    name             = string    
    image_source_url = string  
    container_format = string  
    disk_format      = string  
  })
}

variable "flavor_info" {
  type = object({
    name =string
    ram = string
    vcpus = string
    disk = string
  })
}
