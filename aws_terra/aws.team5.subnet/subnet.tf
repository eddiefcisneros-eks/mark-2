terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
  backend "s3" {
    bucket = "terraformstateplayground"
    key    = "eks/eks-template"
    region = "us-gov-west-1"
  }
}

variable "aws_region" {
  default = " us-gov-west-1"
}
variable "vpc_id" {
  default = "vpc-00ea827319182dc25"
}



data "aws_subnets" "example" {


  filter {
    name   = "tag:Name"
    values = ["PrivateSubnet"]
  }

}
