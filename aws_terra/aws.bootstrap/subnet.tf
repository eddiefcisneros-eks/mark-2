data "aws_subnets" "private" {                              
    filter {
    name = "tag:Name"
    values = ["*Generic Private Subnet *"]
    }                                                       
}                                                                  



data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.private.ids)
  id = each.value
}









/*
data "aws_subnet" "pub_subnet" {
  count = length(data.aws_subnets.pub-subnet.ids)
  id    = tolist(data.aws_subnets.pub-subnet.ids)[count.index]
}
*/
