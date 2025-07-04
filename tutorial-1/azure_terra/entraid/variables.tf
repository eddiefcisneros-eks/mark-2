variable "resource_group_location" {
  default     = "East US"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "lab"
  description = "Prefix of the resource name"
}
variable "resource_group_name_prefix" {
  type        = string
  default     = "Lab2"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}