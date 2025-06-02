terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
     tls = {
      source  = "hashicorp/tls"
      version = "<= 4.0.6"
    }
      helm = {
      source = "hashicorp/helm"
      version = "3.0.0-pre1"
    }
  }
  /*
 backend "s3" {
    bucket = "mitre-jcc2"
    dynamodb_table = "jcc2-staging-eks-table"
    key    = "JCC2-Staging"
    region = "us-gov-west-1"
  }
  */
} 
  
 
  
