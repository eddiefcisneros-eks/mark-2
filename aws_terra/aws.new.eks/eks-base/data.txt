data "aws_subnets" "pub-subnet" {
  filter {
    name   = "tag:Name"
    values = ["*MITRE*"]
    #values = ["*Public Subnet*"]
  }
}
/*
data "tls_certificate" "eks" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}
*/

data "aws_security_group" "selected" {
  filter {
    name = "tag:Name"
    values = ["*Generic MITRE Web *"]
  }
}

data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}


data "aws_vpc" "main" {
  filter {
    name = "tag:Name"
    values = ["Generic VPC"]
  }
  #id = vpc-0b6b2a73a8ab960c4
} 
/*

data "aws_subnet" "pub_subnet" {
  count = length(data.aws_subnets.pub_subnet.ids)
  id    = tolist(data.aws_subnets.pub_subnet.ids)[count.index]
}
*/