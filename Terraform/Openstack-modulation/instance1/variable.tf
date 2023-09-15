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

variable "instance_info" {
  type = object({
    name              = string
  })
}
