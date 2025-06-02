variable "cluster_name" {
  type    = string
}
variable "ebs_driver_version" {
  type    = string 
}
/*
variable "eks_cluster_oidc_provider_url" {
  type    = string
}
*/
variable "aws_region"{
  default = "us-goc-west-1"
}
variable "region"{
  type  = string
}
variable "env"{
  type  = string
}
variable "eks_version"{
  type = string
}
variable "eks_node_name" {
  type  = string
}
/*
variable "url_cert"{
  type = string
}
*/