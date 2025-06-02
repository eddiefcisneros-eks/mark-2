resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.oidc_eks_tls_cert.certificates[0].sha1_fingerprint]
  url             = var.eks_cluster_oidc_provider_url
}
