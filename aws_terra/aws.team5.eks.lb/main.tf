module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "19.5.1"

    cluster_name                    = var.eks_name
    cluster_version                 = "1.21"
    cluster_endpoint_private_access = true
    cluster_endpoint_public_access  = true

    vpc_id     = var.vpc_id
    subnet_ids = var.private_subnet_ids

    eks_managed_node_group_defaults = {
      ami_type               = "AL2_x86_64"
      cluster_additional_security_group_ids = [aws_security_group.eks.id]
      disk_size              = 50
      instance_types         = ["t3.medium", "t3.large"]
      vpc_security_group_ids = [aws_security_group.eks.id]
    }

 cluster_security_group_additional_rules = {
    ingress_nodes_ephemeral_ports_tcp = {
      description                = "Nodes on ephemeral ports"
      protocol                   = "tcp"
      from_port                  = 1025
      to_port                    = 65535
      type                       = "ingress"
      source_node_security_group = true
    }
  }
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }
    egress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "egress"
      self        = true
    }
  }

    eks_managed_node_groups = {
      green = {
        min_size     = 1
        max_size     = 10
        desired_size = 3

        instance_types = ["t3.medium"]
        capacity_type  = "SPOT"
        labels = var.tags 
        taints = {
        }
        tags = var.tags
      }
    }

    tags = var.tags
  }
