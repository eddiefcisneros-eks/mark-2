data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}






/*
data "aws_security_group" "selected" {
  for_each = {
  filter = {
    name = "tag:Name"
    values = ["*Generic MITRE Web *"]
    }
  }
}
*/