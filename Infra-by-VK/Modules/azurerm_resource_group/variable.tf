variable "resource_groups" {
  type = map(object({
    location = string
    resource_group_name = string
    tags     = map(string)
  }))
}