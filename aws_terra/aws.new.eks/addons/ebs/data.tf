data "tls_certificate" "eks" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}

data "aws_eks_cluster" "eks_cluster_name" {
  name = "Heimdall2-OpenCTI"
}
