provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami           = "ami-0c55b159cbfaa5888"
  instance_type = "t2.micro"
}