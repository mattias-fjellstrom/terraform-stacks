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
