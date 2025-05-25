# Create a resource group
resource "azurerm_resource_group" "example" {
  #name     = "example-resources"
  name = var.rg_name    
  location = "West Central US"
}


resource "azurerm_public_ip" "vm_public_ip" {
  name                = "vm-public-ip"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "vm-nic"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "tf_vm" {
  name                = "my-vm"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  size                = "Standard_B1s"
  admin_username      = var.azurevmuser
  admin_password      = var.azurepassword
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "my-osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}



output "rg_id" {
    value = format("Resource Group ID: %s", azurerm_public_ip.vm_public_ip.ip_address)
}