variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "private_clouds" {
  description = "Map of Azure VMware Solution private clouds to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-avs-privatecloud/azurerm v0.13.0 (https://registry.terraform.io/modules/Azure/avm-res-avs-privatecloud/azurerm/0.13.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                 = string
    tags                                 = optional(map(string))
    enable_telemetry                     = optional(bool)
    avs_network_cidr                     = string
    customer_managed_key                 = optional(any, null)
    diagnostic_settings                  = optional(any, null)
    external_storage_address_block       = optional(string, null)
    netapp_files_datastores              = optional(any, null)
    secondary_zone                       = optional(number, null)
    vcenter_identity_sources_credentials = optional(any, null)
    sku_name                             = string
    dns_zone_type                        = optional(string, null)
    elastic_san_datastores               = optional(any, null)
    internet_inbound_public_ips          = optional(any, null)
    primary_zone                         = optional(number, null)
    segments                             = optional(any, null)
    vcf_license                          = optional(any, null)
    dhcp_configuration                   = optional(any, null)
    dns_forwarder_zones                  = optional(any, null)
    expressroute_connections             = optional(any, null)
    extended_network_blocks              = optional(list(string), null)
    gen2_private_cloud                   = optional(any, null)
    managed_identities                   = optional(any, null)
    default_dns_ips                      = optional(list(string), null)
    internet_enabled                     = optional(bool, null)
    nsxt_password                        = optional(string, null)
    vcenter_identity_sources             = optional(any, null)
    vcf_firewall_license                 = optional(any, null)
    avs_interconnect_connections         = optional(any, null)
    clusters                             = optional(any, null)
    global_reach_connections             = optional(any, null)
    vcenter_password                     = optional(string, null)
    enable_stretch_cluster               = optional(bool, null)
    gen2_subnets_user_defined_routes     = optional(any, null)
    lock                                 = optional(any, null)
    role_assignments                     = optional(any, null)
    virtual_network_resource_id          = optional(string, null)
    addons                               = optional(any, null)
    management_cluster_size              = optional(number, null)
  }))
  default = {}
}
