output "region" {
  value       = var.region
  description = "The name of the aws region"
}

output "keyid" {
  value = aws_kms_key.jcc2-kms-key.key_id
}

output "keyarn" {
  value = aws_kms_key.jcc2-kms-key.arn
}

