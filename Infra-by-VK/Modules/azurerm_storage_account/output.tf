output "storage_account_id" {
  value = {
    for k, v in azurerm_storage_account.stg_account_backend :
    k => v.id
  }
}