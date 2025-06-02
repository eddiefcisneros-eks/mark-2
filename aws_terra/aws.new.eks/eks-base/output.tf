/*
output "subnet_ids" {
  value = data.aws_subnets.pub_subnet.id
}
*/

output "current_time" {
  value = time_static.JCRS-e-time.rfc3339
}