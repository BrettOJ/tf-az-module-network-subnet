output "snet_output" {
  depends_on = [azurerm_subnet.subnet_obj]
  value      = azurerm_subnet.subnet_obj
}


