terraform {
  backend "s3" {
    bucket = "mytestbucket120525"  
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/userdata.sh")

  tags = {
    Name = "my_web"
  }
}
