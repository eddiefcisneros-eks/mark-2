/*
output "subnet_ids" {
  value = data.aws_subnets.pub_subnet.id
}
*/

output "current_time" {
  value = time_static.JCRS-e-time.rfc3339
}

data "aws_eks_cluster" "eks_cluster_name" {
  name  = aws_eks_cluster.eks.id
} 
data "tls_certificate" "eks" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

output "tls" {
  value = data.tls_certificate.eks.url
}