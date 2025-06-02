provider "aws" {
  region = local.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
    }
  }
  /*
  backend "s3" {
    bucket = "ecisneros-projects"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "${local.env}-dynamodb-table"
    region = "us-gov-west-1"
  }
  */
}