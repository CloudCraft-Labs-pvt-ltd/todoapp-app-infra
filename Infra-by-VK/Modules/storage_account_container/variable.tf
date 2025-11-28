variable "container_name" {
  description = "The name of the storage container."
  type        = string
}
variable "storage_account_id" {
  description = "The ID of the storage account in which to create the container."
  type        = string
}
variable "container_access_type" {
  description = "The access type of the storage container."
  type        = string
}
