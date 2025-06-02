resource "aws_kms_key" "jcc2-kms-key" {
  description = "JCC2 KMS Key2"
  deletion_window_in_days = 7

  policy = jsonencode({
    "Version": "2012-10-17",
    "Id": "key-default-1",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws-us-gov:iam::133242069230:user/ecisneros"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
          "Sid": "Allow service-linked role use of the customer managed key",
          "Effect": "Allow",
          "Principal": {
              "AWS": [
                  "arn:aws-us-gov:iam::133242069230:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
              ]
          },
          "Action": [
              "kms:Encrypt",
              "kms:Decrypt",
              "kms:ReEncrypt*",
              "kms:GenerateDataKey*",
              "kms:DescribeKey"
          ],
          "Resource": "*"
        },
        {
          "Sid": "Allow attachment of persistent resources",
          "Effect": "Allow",
          "Principal": {
              "AWS": [
                  "arn:aws-us-gov:iam::133242069230:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
              ]
          },
          "Action": [
              "kms:CreateGrant"
          ],
          "Resource": "*",
          "Condition": {
              "Bool": {
                  "kms:GrantIsForAWSResource": true
              }
            }
        }
    ]
  })
}

resource "aws_kms_alias" "jcc2-kms-key" {
  name          = "alias/${var.aws_kms_alias}"
  target_key_id = aws_kms_key.jcc2-kms-key.key_id
}
