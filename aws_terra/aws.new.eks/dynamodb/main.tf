resource "aws_dynamodb_table" "state_lock_table" {
  name           = "${var.env_name}-dynamodb-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    {
      Name          = "${var.env_name}-dynamodb-table"
      Environment   = "var.aws_env_name",
      Creator       = data.external.aws_username.result["name"],
      Creation_time = time_static.JCRS-e-time.rfc3339,
    }
  )
}