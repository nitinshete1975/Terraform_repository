# Create a resource group
resource "azurerm_resource_group" "TerraformSQL" {
  name = "my-sql-server-rg"
  location = "central india"
}

# Create SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name = "my-sql-server-1975"
  resource_group_name = azurerm_resource_group.TerraformSQL.name
  location = azurerm_resource_group.TerraformSQL.location
  version = "12.0"
  administrator_login = "admin" # Change this to your desired admin username
  administrator_login_password = "yourpassword" # Change this to your desired password
}

# Create a sample SQL Database
resource "azurerm_mssql_database" "paydb" {
  name = "paydb"
  server_id = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb  = 1
  sku_name     = "S0"
  enclave_type = "VBS"
}

# Create a Firewall rule
resource "azurerm_mssql_firewall_rule" "firewall_rule" {
  name = "my-sql-sever-firewall"
  server_id = azurerm_mssql_server.sql_server.id
  start_ip_address = "80.85.109.226"  # Replace with your public IP
  end_ip_address   = "80.85.109.226"  # Replace with your public IP"
}