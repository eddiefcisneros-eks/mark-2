resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks.identity[0].oidc[0].issuer


tags = {
    Name          = "${var.env}-${var.cluster_name}-eks-cluster"
   # Creator       = data.external.aws_username.result["name"]
    Creation_time = time_static.JCRS-e-time.rfc3339
  }

}
