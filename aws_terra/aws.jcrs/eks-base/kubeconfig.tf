resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "AWS_PROFILE=jcc2 aws eks --region ${local.region} update-kubeconfig --name ${aws_eks_cluster.eks.name}"
    }
}