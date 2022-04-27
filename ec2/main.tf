provider "aws" {
    region = "ap-northeast-2"
  
}

data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "Default subnet for ap-northeast-2"
  }
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "tf-ubuntu"
  }
}