variable "image_info" {
  type = object({
    name             = string    
    image_source_url = string  
    container_format = string  
    disk_format      = string  
  })
  default = {
    name = "cirros"
    image_source_url = "http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img"
    container_format = "bare"
    disk_format = "qcow2"
  }
}