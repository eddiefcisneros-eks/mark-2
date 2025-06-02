data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}
