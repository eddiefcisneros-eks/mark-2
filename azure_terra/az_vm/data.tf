/*
data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}


data "external" "az_username" {
  program = ["az", "ad", "signed-in-user", "show", "--query", "displayName", "-o", "tsv"]
}
*/
