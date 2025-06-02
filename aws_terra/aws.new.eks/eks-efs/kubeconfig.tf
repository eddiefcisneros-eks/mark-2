resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "aws eks --region ${local.region} update-kubeconfig --name ${aws_eks_cluster.eks.name}"
    }
}