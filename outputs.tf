output "cert" {
  value       = azurerm_key_vault_certificate.main
  description = "The SSL certificate object"
}