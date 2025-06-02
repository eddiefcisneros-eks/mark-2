provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
/*
 backend "s3" {
    bucket = "jcc2-eks-cluster-terra-state-statefile"
    dynamodb_table = "jcc2-eks-cluster-terra-state-terraform_lock"
    key    = "jcc2-kms"
    region = "us-gov-west-1"
  }
*/
}