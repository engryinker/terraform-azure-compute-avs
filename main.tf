data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "private_cloud" {
  source   = "Azure/avm-res-avs-privatecloud/azurerm"
  version  = "0.13.0"
  for_each = var.private_clouds

  name                                 = each.value.name
  location                             = var.location
  resource_group_resource_id           = data.azurerm_resource_group.this.id
  tags                                 = coalesce(each.value.tags, var.tags)
  enable_telemetry                     = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  avs_network_cidr                     = each.value.avs_network_cidr
  customer_managed_key                 = each.value.customer_managed_key
  diagnostic_settings                  = each.value.diagnostic_settings
  external_storage_address_block       = each.value.external_storage_address_block
  netapp_files_datastores              = each.value.netapp_files_datastores
  secondary_zone                       = each.value.secondary_zone
  vcenter_identity_sources_credentials = each.value.vcenter_identity_sources_credentials
  sku_name                             = each.value.sku_name
  dns_zone_type                        = each.value.dns_zone_type
  elastic_san_datastores               = each.value.elastic_san_datastores
  internet_inbound_public_ips          = each.value.internet_inbound_public_ips
  primary_zone                         = each.value.primary_zone
  segments                             = each.value.segments
  vcf_license                          = each.value.vcf_license
  dhcp_configuration                   = each.value.dhcp_configuration
  dns_forwarder_zones                  = each.value.dns_forwarder_zones
  expressroute_connections             = each.value.expressroute_connections
  extended_network_blocks              = each.value.extended_network_blocks
  gen2_private_cloud                   = each.value.gen2_private_cloud
  managed_identities                   = each.value.managed_identities
  default_dns_ips                      = each.value.default_dns_ips
  internet_enabled                     = each.value.internet_enabled
  nsxt_password                        = each.value.nsxt_password
  vcenter_identity_sources             = each.value.vcenter_identity_sources
  vcf_firewall_license                 = each.value.vcf_firewall_license
  avs_interconnect_connections         = each.value.avs_interconnect_connections
  clusters                             = each.value.clusters
  global_reach_connections             = each.value.global_reach_connections
  vcenter_password                     = each.value.vcenter_password
  enable_stretch_cluster               = each.value.enable_stretch_cluster
  gen2_subnets_user_defined_routes     = each.value.gen2_subnets_user_defined_routes
  lock                                 = each.value.lock
  role_assignments                     = each.value.role_assignments
  virtual_network_resource_id          = each.value.virtual_network_resource_id
  addons                               = each.value.addons
  management_cluster_size              = each.value.management_cluster_size
}
