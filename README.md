# terraform-azurerm-storage-account

## Create Azure Storage Account
Azure Storage Account is a cloud-based storage solution provided by Microsoft Azure. It is a scalable and highly available storage service that allows you to store and retrieve large amounts of unstructured, structured, or semi-structured data in the cloud.

This module creates:
- Azure Storage Account
- (Optional) Azure Storage Account Blob Container

## Usage
For the usage example please refer to the [examples](examples/) folder.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_user_assigned_identity.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | (Optional) Defines the access tier to use for this storage account. Valid options are Hot and Cool. Defaults to Hot. | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | (Optional) Defines the Kind of account. Valid options are Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage, and StorageV2Blob. Defaults to Storage. | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | (Optional) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS, and RAGZRS. Defaults to LRS. | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Defaults to Standard. | `string` | `"Standard"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | (Optional) Allow or disallow public access to items in this storage account. Defaults to true. | `bool` | `true` | no |
| <a name="input_allowed_copy_scope"></a> [allowed\_copy\_scope](#input\_allowed\_copy\_scope) | (Optional) The allowed copy scope for this storage account. Valid options are None, Account, Service, Container, and Object. Defaults to None. | `string` | `null` | no |
| <a name="input_azure_files_authentication"></a> [azure\_files\_authentication](#input\_azure\_files\_authentication) | (Optional) An azure\_files\_authentication configuration | <pre>object({<br>    directory_type = string<br>    active_directory = optional(object({<br>      storage_sid = string<br>      domain_name = string<br>      domain_sid = string<br>      domain_guid = string<br>      forest_name = string<br>      netbios_domain_name = string<br>    }), null)<br>  })</pre> | `null` | no |
| <a name="input_blob_properties"></a> [blob\_properties](#input\_blob\_properties) | (Optional) A blob\_properties configuration | <pre>object({<br>    cors_rule = optional(object({<br>      allowed_headers = list(string)<br>      allowed_methods = list(string)<br>      allowed_origins = list(string)<br>      exposed_headers = list(string)<br>      max_age_in_seconds = number<br>    }), null)<br>    delete_retention_policy = optional(object({<br>      days = number<br>    }), null)<br>    restore_policy = optional(object({<br>      days = number<br>    }), null)<br>    versioning_enabled = optional(bool, null)<br>    change_feed_enabled = optional(bool, null)<br>    change_feed_retention_in_days = optional(number, null)<br>    default_service_version = optional(string, null)<br>    last_access_time_enabled = optional(bool, null)<br>    container_delete_retention_policy = optional(object({<br>      days = number<br>    }), null)<br>  })</pre> | `null` | no |
| <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled) | (Optional) Is Cross Tenant Replication Enabled for this storage account? Defaults to false. | `bool` | `false` | no |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | (Optional) A custom\_domain configuration | <pre>object({<br>    name = string<br>    use_subdomain = bool<br>  })</pre> | `null` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | (Optional) A customer\_managed\_key configuration | <pre>object({<br>    key_vault_key_id = string<br>    user_assigned_identity_id = string<br>  })</pre> | `null` | no |
| <a name="input_default_to_oauth_authentication"></a> [default\_to\_oauth\_authentication](#input\_default\_to\_oauth\_authentication) | (Optional) Should the storage account default to OAuth authentication? Defaults to false. | `bool` | `false` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Defines the edge zone to use for this storage account. Valid options are Primary and Secondary. Defaults to Primary. | `string` | `null` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | (Optional) Is HTTPS traffic only enabled for this storage account? Defaults to true. | `bool` | `true` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity configuration | <pre>object({<br>    name = string<br>    type = string<br>    tags = optional(map(string), null)<br>  })</pre> | `null` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | (Optional) Is infrastructure encryption enabled for this storage account? Defaults to true. | `bool` | `true` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | (Optional) Is Hierarchical Namespace enabled for this storage account? Defaults to false. | `bool` | `null` | no |
| <a name="input_large_file_share_enabled"></a> [large\_file\_share\_enabled](#input\_large\_file\_share\_enabled) | (Optional) Is Large File Share enabled for this storage account? Defaults to false. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location in which to create the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | (Optional) The minimum supported TLS version for this storage account. Valid options are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2. | `string` | `"TLS1_2"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Storage Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | (Optional) A network\_rules configuration | <pre>object({<br>    default_action = string<br>    bypass = optional(list(string), null)<br>    ip_rules = optional(list(string), null)<br>    virtual_network_subnet_ids = optional(list(string), null)<br>    private_link_access = optional(object({<br>      endpoint_resource_id = string<br>      endpoint_tenant_id = optional(string, null)<br>    }), null)<br>  })</pre> | `null` | no |
| <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled) | (Optional) Is NFSv3 enabled for this storage account? Defaults to false. | `bool` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Is public network access enabled for this storage account? Defaults to true. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_routing"></a> [routing](#input\_routing) | (Optional) A routing configuration | <pre>object({<br>    publish_internet_endpoints = optional(bool, null)<br>    publish_microsoft_endpoints = optional(bool, null)<br>    choice = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_sas_policy"></a> [sas\_policy](#input\_sas\_policy) | (Optional) A sas\_policy configuration | <pre>object({<br>    expiration_period = string<br>    expiration_action = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled) | (Optional) Is SFTP enabled for this storage account? Defaults to false. | `bool` | `false` | no |
| <a name="input_share_properties"></a> [share\_properties](#input\_share\_properties) | (Optional) A share\_properties configuration | <pre>object({<br>    cors_rule = optional(object({<br>      allowed_headers = list(string)<br>      allowed_methods = list(string)<br>      allowed_origins = list(string)<br>      exposed_headers = list(string)<br>      max_age_in_seconds = number<br>    }), null)<br>    delete_retention_policy = optional(object({<br>      days = number<br>    }), null)<br>    smb = optional(object({<br>      versions = optional(list(string), null)<br>      authentication_types = optional(list(string), null)<br>      channel_encryption = optional(string, null)<br>      kerberos_ticket_encryption_type = optional(list(string), null)<br>      channel_encryption_type = optional(list(string), null)<br>      multichannel_enabled = optional(bool, null)<br>    }), null)<br>  })</pre> | `null` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | (Optional) Is Shared Access Key enabled for this storage account? Defaults to true. | `bool` | `true` | no |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | (Optional) A static\_website configuration | <pre>object({<br>    index_document = optional(string, null)<br>    error_404_document = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_storage_containers"></a> [storage\_containers](#input\_storage\_containers) | (Optional) A list of storage\_containers configurations | <pre>list(object({<br>    name = string<br>    container_access_type = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account. |
<!-- END_TF_DOCS -->