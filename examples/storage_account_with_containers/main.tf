resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-northeu-001"
  location = "northeurope"
}

module "storage-account-logs" {
  source = "Retoxx-dev/storage-account/azurerm"
  version = "1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  name = "stterraformnortheu001"
  
  blob_properties = {
    versioning_enabled = true
    change_feed_enabled = true
  }

  storage_containers =[
    {
      name = "Container1"
    },
    {
      name = "Container2"
    }
  ]
}