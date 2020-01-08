module "vpc_label" {
  source      = "git::https://github.com/mkiac/terraform-null-label.git?ref=master"
  region      = var.aws_region
  name        = "vpc"
  type        = var.type
  environment = var.environment
  delimiter   = var.delimiter
  attributes  = var.attributes
  tags        = var.tags
  label_order = ["prefix", "region", "name", "type", "environment", "attributes"]
}

module "sg_label" {
  source      = "git::https://github.com/mkiac/terraform-null-label.git?ref=master"
  region      = var.aws_region
  name        = "sg"
  type        = var.type
  environment = var.environment
  delimiter   = var.delimiter
  attributes  = var.attributes
  tags        = var.tags
  label_order = ["prefix", "region", "name", "type", "environment", "attributes"]
}

module "igw_label" {
  source      = "git::https://github.com/mkiac/terraform-null-label.git?ref=master"
  region      = var.aws_region
  name        = "igw"
  type        = var.type
  environment = var.environment
  delimiter   = var.delimiter
  attributes  = var.attributes
  tags        = var.tags
  label_order = ["prefix", "region", "name", "type", "environment", "attributes"]
}

resource "aws_vpc" "default" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = true
  tags                             = module.vpc_label.tags
}

# If `aws_default_security_group` is not defined, it would be created implicitly with access `0.0.0.0/0`
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.default.id
  tags   = module.vpc_label.tags
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags   = module.igw_label.tags
}
