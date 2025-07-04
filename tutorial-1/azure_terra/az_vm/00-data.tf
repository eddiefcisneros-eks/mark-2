/*
data "external" "aws_username" {
  program = ["sh", "-c", "aws sts get-caller-identity --output text --query 'Arn' | cut -d\"/\" -f2 | tr . \" \" | jq -R -c '{name: .}'"]
}


data "external" "az_username"{
program = ["az ad signed-in-user show --query displayName -o text"]
}
*/
 data "external" "user" {
      program = ["powershell", "./script.ps1"] 
    }
/*
    output "display_name" {
      value = data.external.user.result
    }

*/
output "user_message" {
  value = data.external.user.result.message
}

output "user_timestamp" {
  value = data.external.user.result.timestamp
}