variable "aggregate_info" {
  type = object({
    name = string
    zone = string
    hosts = list(string)
  })
  default = {
    name  = "comp1"
    zone  = "comp1"
    hosts = ["compute"]
  }
}