# Create a virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "Central India"
  resource_group_name = azurerm_resource_group.Terraform.name
}

# Create a subnet
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_resource_group.Terraform.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                = "myNIC"
  location            = "Central India"
  resource_group_name = azurerm_resource_group.Terraform.name

# Configure the IP settings for the network interface
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = "Dynamic"
  }

}