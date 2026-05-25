resource "azurerm_managed_disk" "mymanageddisk" {
  name                 = "mymgmddisk1"
  location             = "Central India"
  resource_group_name  = azurerm_resource_group.Terraform.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "staging"
  }
}