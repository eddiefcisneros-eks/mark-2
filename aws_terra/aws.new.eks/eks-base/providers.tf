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
  
  backend "s3" {
    bucket = "mitre-jcc2"
    dynamodb_table = "jcc2-staging-dynamodb-table"
    key    = "JCC2-Staging"
    region = "us-gov-west-1"
  }
  
}