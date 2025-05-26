

# Existing Resource Group
data "azurerm_resource_group" "existing_rg" {
  name = var.rg_name
}

# Existing VNet
data "azurerm_virtual_network" "existing_vnet" {
  #name                = "istiovnet"
  name                = var.azurevnet
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

# Existing Subnet
data "azurerm_subnet" "existing_subnet" {
  name                 = var.azuresubnet
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
}
