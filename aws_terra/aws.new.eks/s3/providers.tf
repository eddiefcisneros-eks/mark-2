provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
    }
    time = {
      source = "hashicorp/time"
      version = "0.12.1"
    }
    external = {
      source = "hashicorp/external"
      version = "2.3.4"
    }
  }
}