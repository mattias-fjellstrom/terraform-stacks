variable "name_suffix" {
  type        = string
  description = "Name suffix for resources"
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "Azure resource group object"
}

variable "virtual_network_address" {
  type    = string
  default = "10.0.0.0/16"
}
