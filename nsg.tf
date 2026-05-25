resource "azurerm_network_security_group" "mynsg" {
  name                = "mySecurityGroup1"
  location            = "Central India"
  resource_group_name = azurerm_resource_group.Terraform.name

  security_rule {
    name                       = "NSGRule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}