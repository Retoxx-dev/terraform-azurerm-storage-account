resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-northeu-001"
  location = "northeurope"
}

module "storage-account-logs" {
  source = "../../terraform-azurerm-storage-account"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  name = "stterraformnortheu001"
  
  blob_properties = {
    versioning_enabled = true
    change_feed_enabled = true
  }

  storage_containers =[
    {
      name = "loki"
    },
    {
      name = "admin"
    },
    {
      name = "chunks"
    },
    {
      name = "ruler"
    }
  ]
}