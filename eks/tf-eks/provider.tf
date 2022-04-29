terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["us-east-2a","us-east-2c"]
}