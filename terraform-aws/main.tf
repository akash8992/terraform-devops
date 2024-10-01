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

locals {
  instances = ["server-1", "server-2", "server-3"]  # Changed to a list to allow indexing
}

resource "aws_instance" "my_ec2_instance" {
  count = length(local.instances)  # Adjust the count dynamically based on the list length

  ami                    = "ami-0c2af51e265bd5e0e"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0cb4928670fdbbef0"
  associate_public_ip_address = true

  tags = {
    Name = "terraformBatchInstance-${local.instances[count.index]}"  # Index from the list
  }
}

resource "aws_s3_bucket" "my_s3_bucket" {
  for_each = toset(local.instances)  # Still use a set for the S3 bucket for uniqueness

  bucket = "terraform-learning-112-${each.key}"  # Unique bucket name
  tags = {
    Name        = "terraform-learning-112-${each.key}"
    Environment = "Dev"
  }
}


