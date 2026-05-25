
# Create a resource group
resource "azurerm_resource_group" "Terraform" {
  name     = var.resource-group
  location = var.region
}

# Create a virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = var.vnet
  address_space       = var.network-prefix
  location            = var.region
  resource_group_name = azurerm_resource_group.Terraform.name
}

# Create a subnet
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.Terraform.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = [var.subnet-prefix]
}

# Create a network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                = var.Netinterface
  location            = var.region
  resource_group_name = azurerm_resource_group.Terraform.name

# Configure the IP settings for the network interface
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = var.ipallocation
  }

}

# Create a virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
  name                  = var.vmname
  location              = var.region
  resource_group_name   = azurerm_resource_group.Terraform.name
  network_interface_ids = [azurerm_network_interface.myterraformnic.id]
  vm_size               = var.vmsize

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

# Configure the storage image reference and OS disk
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # Configure the OS disk
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Configure the OS profile and Linux configuration
  os_profile {
    computer_name  = "hostname"
    admin_username = "admin"
    admin_password = "YourPAssword"
  }

  # Configure the Linux configuration for the OS profile
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}