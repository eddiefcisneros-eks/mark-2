/*
resource "azurerm_resource_group" "example" {
  name     = "production-nwwatcher"
  location = "East US"
}
*/
resource "azurerm_network_watcher" "lab_network_watcher" {
  name                = "production-nwwatcher"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}