# Create virtual network
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Create virtual network 
resource "azurerm_virtual_network" "core_network" {
  name                = var.vnet_name
  address_space       = [var.VNET_IP]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
# Create subnet private
resource "azurerm_subnet" "private_subnet" {
  name                 = var.subnet_private_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.core_network.name
  address_prefixes     = [var.subnet_private_IP]
}

# Create subnet public
resource "azurerm_subnet" "public_subnet" {
  name                 = var.subnet_public_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.core_network.name
  address_prefixes     = [var.subnet_public_IP]
}