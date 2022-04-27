provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_instance" "one-server" {
    ami = "ami-0ed11f3863410c386"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello Peter" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF

    tags = {
     Name = "tf-example"
    }
}

resource "aws_security_group" "instance" {
    
    name = var.aws_security_group_name

    ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
}

variable "aws_security_group_name" {
    description = "the name of security group"
    type = string
    default = "terraform-example-instance"
  
}

output "public_ip" {
    value = aws_instance.one-server.public_ip
    description = "the public IP of the instance"
  
}

