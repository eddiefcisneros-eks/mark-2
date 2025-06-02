variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the alb-asg resources"
}

variable "region" {
  type        = string
  description = "Region of the alb-asg"
}

/*
variable "hash_key" {
  type        = string
  description = "Hash key name of dynamodb"
}

variable "attribute_name" {
  type        = string
  description = "Attribute name of dynamodb"
}

variable "attribute_type" {
  type        = string
  description = "Attribute type of dynamodb"
}
*/
variable "env_name" {
  type        = string
  description = "The environment name for the resources."
}




