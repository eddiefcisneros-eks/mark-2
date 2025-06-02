resource "helm_release" "ebs_csi_driver" {
  name = "aws-ebs-csi-driver"

  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  namespace  = "kube-system"
  #version    = "2.17.4"

  set = [ 
    {
    name  = "controller.serviceAccount.name"
    value = "ebs-csi-controller-sa"
  },
  
  {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.eks_ebs_csi_driver.arn
  }  
  ]
}
