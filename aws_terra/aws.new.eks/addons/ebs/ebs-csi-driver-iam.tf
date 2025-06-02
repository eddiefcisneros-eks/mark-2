data "aws_iam_policy_document" "ebs-csi" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringLike"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:ebs-csi-*"]
    }
    condition {
      test     = "StringLike"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "eks_ebs_csi_driver" {
  assume_role_policy = data.aws_iam_policy_document.ebs-csi.json
  name               = "AmazonEKS_EBS_CSI_DriverRole"
  tags = {
    Name          = "${var.aws_env_name}-${data.aws_eks_cluster.eks_cluster_name}-eks-cluster"
    Creator       = data.external.aws_username.result["name"]
    Creation_time = time_static.JCRS-e-time.rfc3339
  }
}

resource "aws_iam_role_policy_attachment" "amazon_ebs_csi_driver" {
  role       = aws_iam_role.eks_ebs_csi_driver.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
}
