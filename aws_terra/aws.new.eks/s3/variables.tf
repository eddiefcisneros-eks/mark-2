variable eks_name_cluster {
  description = "Environment Name "
  type        = string
}
variable  region {
  description = "The name of the AWS Region"
  type        = string
}          
  variable  zone1 {
  description = "Az 1"
  type        = string
}

 variable  eks_name {
  description = "EKS cluster name"
  type        = string
}
  variable  zone2 {
  description = "Az 2"
  type        = string
}
  variable  eks_version {
  description = "EKS cluster version"
  type        = string
}
  
  variable  eks_node_name {
  description = "Cluster Node group name"
  type        = string
}
  variable "env_name" {
    type = string
  }

variable "project" {
  description = "Project Name"
  type      = string
}