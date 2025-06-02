resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "${random_pet.rg_name.id}-rg"
  tags = {
    environment = "Production"
    project     = "Terraform Lab"
    Creation_time = time_static.JCRS-e-time.rfc3339
  }
}
