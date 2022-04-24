#테라폼 버전은 생략하면 최신버전으로 설치된다.
# terraform {
#   required_providers {
#     local = {
#       source = "hashicorp/local"
#       version = "2.2.2"
#     }
#   }
# }

provider "local" {
  # Configuration options
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "example" {
  cidr_block = "10.123.0.0/16"

  tags = {
      "name" = "test vpc with tf"

  }
}

data "aws_vpcs" "this" {
  
}

output "vpc_example" {
    value = data.aws_vpcs.this
  
}