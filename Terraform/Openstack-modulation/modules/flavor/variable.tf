variable "flavor_info" {
  type = object({
    name  = string
    ram   = string
    vcpus = string
    disk  = string
  })
  default = {
    name  = "1-1-1"
    ram   = "1024"
    vcpus = "1"
    disk  = "1"
  }
}