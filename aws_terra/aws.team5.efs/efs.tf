# 1- Create EFS that Pod of the cluster will use
resource "aws_efs_file_system" "efs" {
  creation_token = "${var.area}-data-efs"
  performance_mode = "generalPurpose"

  lifecycle_policy {
    transition_to_ia = "AFTER_60_DAYS"
  }

  tags = {
    Name        = "${var.area}-data-efs"
    Environment = var.area
  }
}

# 2- Set security groups for EFS

resource "aws_security_group" "efs" {
   name = "${var.area}-efs-sg"
   description= "Allow inbound efs traffic from Kubernetes Subnet"
   vpc_id = module.hg_vpc.vpc_id

   ingress {
     cidr_blocks = module.hg_vpc.publics_subnets_cidr
     from_port = 2049
     to_port = 2049 
     protocol = "tcp"
   }     
        
   egress {
     cidr_blocks = module.hg_vpc.publics_subnets_cidr
     from_port = 0
     to_port = 0
     protocol = "-1"
   }

   depends_on = [
     module.hg_vpc
   ]
 }

# 3- Set EFS mount target
resource "aws_efs_mount_target" "efs_mount_target" {
  count = length(module.hg_vpc.publics_subnets_id)
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = module.hg_vpc.publics_subnets_id[count.index]
  security_groups = [aws_security_group.efs.id]
}

# 4- Output
output "efs_id" {
  value = aws_efs_file_system.efs.id
}

output "efs_dns_name" {
  value = aws_efs_file_system.efs.dns_name
}