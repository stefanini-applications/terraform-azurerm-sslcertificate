variable "name" {
  type        = string
  description = "The name of the certificate resource on Azure"
}

variable "url" {
  type        = string
  description = "The URL for the certificate"
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the key vault resource"
}