#################################################################
# GENERAL
#################################################################

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Kubernetes Cluster."
}

variable "location" {
  type        = string
  description = "(Required) The location in which to create the Kubernetes Cluster."
}

#################################################################
# STORAGE ACCOUNT
#################################################################

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Storage Account. Changing this forces a new resource to be created."
}

variable "account_kind" {
  type        = string
  description = "(Optional) Defines the Kind of account. Valid options are Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage, and StorageV2Blob. Defaults to Storage."
  default     = "StorageV2"
}

variable "account_tier" {
  type        = string
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Defaults to Standard."
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "(Optional) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS, and RAGZRS. Defaults to LRS."
  default     = "LRS"
}

variable "cross_tenant_replication_enabled" {
  type        = bool
  description = "(Optional) Is Cross Tenant Replication Enabled for this storage account? Defaults to false."
  default     = false
}

variable "access_tier" {
  type        = string
  description = "(Optional) Defines the access tier to use for this storage account. Valid options are Hot and Cool. Defaults to Hot."
  default     = "Hot"
}

variable "edge_zone" {
  type        = string
  description = "(Optional) Defines the edge zone to use for this storage account. Valid options are Primary and Secondary. Defaults to Primary."
  default     = null
}

variable "enable_https_traffic_only" {
  type        = bool
  description = "(Optional) Is HTTPS traffic only enabled for this storage account? Defaults to true."
  default     = true
}

variable "min_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for this storage account. Valid options are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2."
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "(Optional) Allow or disallow public access to items in this storage account. Defaults to true."
  default     = true
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "(Optional) Is Shared Access Key enabled for this storage account? Defaults to true."
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Is public network access enabled for this storage account? Defaults to true."
  default     = true
}

variable "default_to_oauth_authentication" {
  type        = bool
  description = "(Optional) Should the storage account default to OAuth authentication? Defaults to false."
  default     = false
}

variable "is_hns_enabled" {
  type        = bool
  description = "(Optional) Is Hierarchical Namespace enabled for this storage account? Defaults to false."
  default     = null
}

variable "nfsv3_enabled" {
  type        = bool
  description = "(Optional) Is NFSv3 enabled for this storage account? Defaults to false."
  default     = false
}

variable "custom_domain" {
  type        = object({
    name = string
    use_subdomain = bool
  })
  description = "(Optional) A custom_domain configuration"
  default     = null
}

variable "customer_managed_key" {
  type = object({
    key_vault_key_id = string
    user_assigned_identity_id = string
  })
  description = "(Optional) A customer_managed_key configuration"
  default = null
}

variable "identity" {
  type = object({
    name = string
    type = string
    tags = optional(map(string), null)
  })
  description = "(Optional) An identity configuration"
  default = null
}

variable "blob_properties" {
  type = object({
    cors_rule = optional(object({
      allowed_headers = list(string)
      allowed_methods = list(string)
      allowed_origins = list(string)
      exposed_headers = list(string)
      max_age_in_seconds = number
    }), null)
    delete_retention_policy = optional(object({
      days = number
    }), null)
    restore_policy = optional(object({
      days = number
    }), null)
    versioning_enabled = optional(bool, null)
    change_feed_enabled = optional(bool, null)
    change_feed_retention_in_days = optional(number, null)
    default_service_version = optional(string, null)
    last_access_time_enabled = optional(bool, null)
    container_delete_retention_policy = optional(object({
      days = number
    }), null)
  })
  description = "(Optional) A blob_properties configuration"
  default = null
}

variable "static_website" {
  type = object({
    index_document = optional(string, null)
    error_404_document = optional(string, null)
  })
  description = "(Optional) A static_website configuration"
  default = null
}

variable "share_properties" {
  type = object({
    cors_rule = optional(object({
      allowed_headers = list(string)
      allowed_methods = list(string)
      allowed_origins = list(string)
      exposed_headers = list(string)
      max_age_in_seconds = number
    }), null)
    delete_retention_policy = optional(object({
      days = number
    }), null)
    smb = optional(object({
      versions = optional(list(string), null)
      authentication_types = optional(list(string), null)
      channel_encryption = optional(string, null)
      kerberos_ticket_encryption_type = optional(list(string), null)
      channel_encryption_type = optional(list(string), null)
      multichannel_enabled = optional(bool, null)
    }), null)
  })
  description = "(Optional) A share_properties configuration"
  default = null
}

variable "network_rules" {
  type = object({
    default_action = string
    bypass = optional(list(string), null)
    ip_rules = optional(list(string), null)
    virtual_network_subnet_ids = optional(list(string), null)
    private_link_access = optional(object({
      endpoint_resource_id = string
      endpoint_tenant_id = optional(string, null)
    }), null)
  })
  description = "(Optional) A network_rules configuration"
  default = null
}

variable "large_file_share_enabled" {
  type = bool
  description = "(Optional) Is Large File Share enabled for this storage account? Defaults to false."
  default = false
}

variable "azure_files_authentication" {
  type = object({
    directory_type = string
    active_directory = optional(object({
      storage_sid = string
      domain_name = string
      domain_sid = string
      domain_guid = string
      forest_name = string
      netbios_domain_name = string
    }), null)
  })
  description = "(Optional) An azure_files_authentication configuration"
  default = null
}

variable "routing" {
  type = object({
    publish_internet_endpoints = optional(bool, null)
    publish_microsoft_endpoints = optional(bool, null)
    choice = optional(string, null)
  })
  description = "(Optional) A routing configuration"
  default = null
}

variable "infrastructure_encryption_enabled" {
  type = bool
  description = "(Optional) Is infrastructure encryption enabled for this storage account? Defaults to true."
  default = true
}

variable "sas_policy" {
  type = object({
    expiration_period = string
    expiration_action = optional(string, null)
  })
  description = "(Optional) A sas_policy configuration"
  default = null
}

variable "allowed_copy_scope" {
  type = string
  description = "(Optional) The allowed copy scope for this storage account. Valid options are None, Account, Service, Container, and Object. Defaults to None."
  default = null
}

variable "sftp_enabled" {
  type = bool
  description = "(Optional) Is SFTP enabled for this storage account? Defaults to false."
  default = false
}

variable "tags" {
  type = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default = null
}

#################################################################
# STORAGE ACCOUNT CONTAINERS
#################################################################

variable "storage_containers" {
  type = list(object({
    name = string
    container_access_type = optional(string, null)
  }))
  description = "(Optional) A list of storage_containers configurations"
  default = []
}