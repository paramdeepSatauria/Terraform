variable "volume_info" {
  type = object({
    name              = string
    availability_zone = string
    size              = number
    description       = string
  })
  default = {
    name = "volume_1"
    availability_zone = "vol-comp1"
    size = 1
    description = "test volume"
  }
}