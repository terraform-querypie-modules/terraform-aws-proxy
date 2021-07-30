locals {
  vpc_id = var.vpc_id
}

data "aws_vpc" "this" {
  vpc_id = vpc_id
}

data "aws_ami" "this" {
  filter {
    name = ""
    values = []
  }
}

