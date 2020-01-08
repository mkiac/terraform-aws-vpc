variable "prefix" {
  description = "prefix (e.g. `region`)"
  type        = string
  default     = ""
}

variable "type" {
  description = "type (e.g. `shared`, `app`)"
  type        = string
  default     = ""
}

variable "environment" {
  description = "type (e.g. `prod`, `dev`, `staging`)"
  type        = string
  default     = ""
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `prefix`, `type`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "cidr_block" {
  type        = string
  description = "CIDR for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable "enable_classiclink" {
  type        = bool
  description = "A boolean flag to enable/disable ClassicLink for the VPC"
  default     = null
}

variable "enable_classiclink_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC"
  default     = null
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  description = "A boolean flag to enable/disable IPV6 for the VPC"
  default     = false
}
