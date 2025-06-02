#-----------------
#General Variables
#-----------------

variable "region" {
   description = "region"
   type = string
}
/*
variable "availability_zone" {
  description = "Availability Zones for the Subnet"
  type        = string
}
*/

#--------------
# s3 Variables
#--------------

variable "project_name" {
   description = "Project information bucket"
   type = string
}

variable "s3_state_bucket_name" {
   description = "Project information bucket"
   type        = string
}
variable "s3_versioning_status" {
  description = "Versioning for bucket"
  type        = string
}

variable "s3_force_destroy" {
  description = "Force destroy the bucket"
  type = bool
}

variable "aws_kms_alias" {
  description = "kms alias for s3"
  type        = string
}
# -------------------------------------------
# DynamoDB Variables
# -------------------------------------------
variable "db_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = null
}

variable "hash_key" {
  description = "DynamoDB hash ke"
  type        = string
  default     = "LockID"
}

variable "attr_name" {
  description = "DynamoDB attribute name"
  type        = string
  default     = "LockID"
}

variable "attr_type" {
  description = "DynamoDB attribute type"
  type        = string
  default     = "S"
}