resource "aws_organizations_policy" "tag_policy" {
  name        = var.policy_name
  description = "Resource Provision"
}