provider "aws" {
  region = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "example" {
  ami           = "ami-0994c095691a46fb5"
  instance_type = "t2.small"

  tags = {
    name = "example"
  }
}

data "aws_instances" "test" {
  instance_tags = {
    name = "example"
  }
  instance_state_names = ["pending", "running", "shutting-down", "terminated", "stopping", "stopped"]

  depends_on = [
    "aws_instance.example"
  ]
}
