resource "aws_iam_role" "eks" {
  name = "${var.env}-${var.cluster_name}-eks-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws-us-gov:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

resource "aws_eks_cluster" "eks" {
  name     = "${var.env}-${var.cluster_name}"
  version  = var.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    security_group_ids = [data.aws_security_group.selected.id]
    subnet_ids = data.aws_subnet.pub_subnet[*].id
  }
  tags = {
    #Creator       = data.external.aws_username.result["name"]
    Name          = "${var.env}-${var.cluster_name}-eks-cluster"
    Creation_time = time_static.JCRS-e-time.rfc3339
    
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [aws_iam_role_policy_attachment.eks]
}