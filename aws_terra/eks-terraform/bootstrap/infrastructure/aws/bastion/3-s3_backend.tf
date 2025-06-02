#Bucket to hold terraform state file
resource "aws_s3_bucket" "state_file" {
  bucket = "${var.project_name}-${var.s3_state_bucket_name}-statefile"
   force_destroy = var.s3_force_destroy
   tags = {
    Name          = "${var.project_name}-locks_terraform_state"
    Environment   = var.project_name
    Creator       = data.external.aws_username.result["name"]
    Creation_time = time_static.JCRS-e-time.rfc3339
  }
}

#Versioning for State Bucket
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.state_file.bucket

  versioning_configuration {
    status = var.s3_versioning_status
  }
}

#Blocking public access to the State Bucket
resource "aws_s3_bucket_public_access_block" "state" {
  bucket                  = aws_s3_bucket.state_file.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


#Enables Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = aws_s3_bucket.state_file.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.jcc2-kms-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "state_kms_key" {
  description             = "s3 bucket encryption key"
  deletion_window_in_days = 10
}
