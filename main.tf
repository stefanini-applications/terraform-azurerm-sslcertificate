resource "azurerm_key_vault_certificate" "main" {
  name         = var.name
  key_vault_id = var.keyvault_id

  certificate_policy {
    issuer_parameters {
      name = "GlobalSign-CA"
    }

    key_properties {
      exportable = true
      key_size   = 4096
      key_type   = "RSA"
      reuse_key  = false
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      extended_key_usage = ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]

      key_usage = [
        "digitalSignature",
        "keyEncipherment",
      ]

      subject            = "C=US, ST=Michigan, L=Southfield, O=\"Stefanini, Inc.\", CN=${var.url}"
      validity_in_months = 12
    }
  }
}