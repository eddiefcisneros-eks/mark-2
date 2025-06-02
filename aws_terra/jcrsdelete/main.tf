module "eksbase" {
  source                          = "./eksbase"
  cluster_name                    = var.cluster_name
  region                          = var.region
  env                             = var.env
  eks_version                     = var.eks_version 
  eks_node_name                   = var.eks_node_name
  ebs_driver_version              = var.ebs_driver_version
  #eks_oidc                        = data.tls_certificate.eks.issuer
}
/*
module "ebs" {
  source                          = "./ebs"
  region                          = var.region
  eks_version                     = var.eks_version 
  env                             = var.env
  cluster_name                    = var.cluster_name
  eks_node_name                   = var.eks_node_name
  ebs_driver_version              = var.ebs_driver_version
  
}



data "eks_cluster_name" "openid_connect_provider_url"{
    name = var.cluster_name
}
*/
