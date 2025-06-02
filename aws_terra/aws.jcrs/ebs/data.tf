
data "eks_cluster_name" "openid_connect_provider_url"{
    name = var.cluster_name
}
data "aws_iam_policy_document" "ebs-csi" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringLike"
      variable = "${replace(var.eks_cluster_oidc_provider_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:ebs-csi-*"]
    }
    condition {
      test     = "StringLike"
      variable = "${replace(var.eks_cluster_oidc_provider_url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

data "tls_certificate" "oidc_eks_tls_cert" {
  url = var.eks_cluster_oidc_provider_url
}