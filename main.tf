resource "azurerm_resource_group" "rgs" {
    for_each = var.resource_groups
  name     = "example-resources"
  location = "West Europe"
}