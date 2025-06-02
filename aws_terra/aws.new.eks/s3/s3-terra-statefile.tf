

resource "aws_s3_bucket" "terraform-state" {
  bucket = "${var.project}-${var.eks_name}-eks-bucket"
  tags = {
    Name          = "${var.project}-locks_terraform_state"
    Environment   = var.project
    Creator       = data.external.aws_username.result["name"]
    Creation_time = time_static.JCRS-e-time.rfc3339

  }
}