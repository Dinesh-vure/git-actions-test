terraform {
  backend "s3" {
    bucket  = "dinesh-terraform-state-557649278937"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "latest" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.latest.id
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-ec2"
  }
}
