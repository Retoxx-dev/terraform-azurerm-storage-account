#################################################################
# STORAGE ACCOUNT
#################################################################

output "id" {
  value = azurerm_storage_account.this.id
  description = "The ID of the Storage Account."
}