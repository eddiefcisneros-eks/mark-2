resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name             = aws_eks_cluster.eks.name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.38.1-eksbuild.1"
  service_account_role_arn = aws_iam_role.eks_ebs_csi_driver.arn

  depends_on = [ 
    aws_eks_node_group.general
   ]
  tags = {
    Name          = "${var.aws_env_name}-${data.aws_eks_cluster.eks_cluster_name}-eks-cluster"
    Creator       = data.external.aws_username.result["name"]
    Creation_time = time_static.JCRS-e-time.rfc3339
  }
}
