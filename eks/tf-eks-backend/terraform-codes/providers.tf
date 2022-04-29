terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "test-s3-tf-state"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "test-ddb-tf-lock"
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["us-east-2a","us-east-2c"]
}
