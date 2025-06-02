variable "resource_group_location" {
}
variable "resource_group_name_prefix" {
}

##########  Networking 

variable "vnet_name" {
}
variable "VNET_IP" {
  type = string
}
variable "subnet_private_name" {
  type = string
}
variable "subnet_private_IP" {
  type = string
}
variable "subnet_public_name" {
  type = string
}
variable "subnet_public_IP" {
  type = string
}