terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2_instance" {
  count = 4
  ami           = "ami-0c2af51e265bd5e0e"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0cb4928670fdbbef0"  # Add the subnet ID here
  associate_public_ip_address = true  # Automatically assign a public IP

  tags = {
    Name = "terraformBatchInstance- ${count.index}"
  }
}


resource "aws_s3_bucket" "my_s3_bucket" {
	bucket = "terraform-leaarning-112"
	tags = {
		Name = "terraform-leaarning-112"
		Environment = "Dev"
}
}


output "ec2_public_ips" {
	value = aws_instance.my_ec2_instance[*].public_ip
}
