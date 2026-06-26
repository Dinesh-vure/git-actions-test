provider "aws" {
  region = "us-east-1"
}

# Get the latest Amazon Linux 2023 AMI
data "aws_ami" "latest" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

# Create EC2 instance
resource "aws_instance" "dev" {
  ami           = data.aws_ami.latest.id
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-ec2"
  }
}
