data "tls_certificate" "eks" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

data "aws_security_group" "selected" {
  filter {
    name = "tag:Name"
    values = ["* MITRE Web*"]
  }
}



data "aws_vpcs" "default_vpc" {
  tags = {
    Name = "Generic VPC"
  }
}

data "aws_subnets" "pub-subnet" {
  filter {
    name   = "tag:Name"
    values = ["*Subnet*"]
    #values = ["*Private Subnet*"]
    #values = ["*Public Subnet*"]
  }
}

data "aws_subnet" "pub_subnet" {
  count = length(data.aws_subnets.pub-subnet.ids)
  id    = tolist(data.aws_subnets.pub-subnet.ids)[count.index]
}

output "subnet_cidr_blocks" {
  value = data.aws_subnet.pub_subnet.*.id
}
data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}
