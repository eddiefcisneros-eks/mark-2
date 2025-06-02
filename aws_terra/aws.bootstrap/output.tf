output "subnet" {
    value = [for subnet in data.aws_subnet.subnet : subnet.id]
}

/*
output "name" {
  value = data.aws_subnet.pub_subnet[*].id
}
*/