variable "location" {
  type        = string
  description = "Azure location"
}

variable "name_suffix" {
  type    = string
  default = "techtalk"
}

variable "identity_token" {
  type      = string
  ephemeral = true
}

variable "client_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}