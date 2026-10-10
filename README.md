# terraform-azure-compute-avs

Org-standard Terraform wrapper for: **Azure VMware Solution private clouds**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-avs" {
  source = "git::https://github.com/<org>/terraform-azure-compute-avs.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  private_clouds = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `private_clouds` (Azure VMware Solution private clouds)

Wraps [Azure/avm-res-avs-privatecloud/azurerm](https://registry.terraform.io/modules/Azure/avm-res-avs-privatecloud/azurerm/0.13.0) v0.13.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `avs_network_cidr` | `string` | yes |  |
| `customer_managed_key` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `external_storage_address_block` | `string` | no |  |
| `netapp_files_datastores` | `any` | no |  |
| `secondary_zone` | `number` | no |  |
| `vcenter_identity_sources_credentials` | `any` | no |  |
| `sku_name` | `string` | yes |  |
| `dns_zone_type` | `string` | no |  |
| `elastic_san_datastores` | `any` | no |  |
| `internet_inbound_public_ips` | `any` | no |  |
| `primary_zone` | `number` | no |  |
| `segments` | `any` | no |  |
| `vcf_license` | `any` | no |  |
| `dhcp_configuration` | `any` | no |  |
| `dns_forwarder_zones` | `any` | no |  |
| `expressroute_connections` | `any` | no |  |
| `extended_network_blocks` | `list(string)` | no |  |
| `gen2_private_cloud` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `default_dns_ips` | `list(string)` | no |  |
| `internet_enabled` | `bool` | no |  |
| `nsxt_password` | `string` | no |  |
| `vcenter_identity_sources` | `any` | no |  |
| `vcf_firewall_license` | `any` | no |  |
| `avs_interconnect_connections` | `any` | no |  |
| `clusters` | `any` | no |  |
| `global_reach_connections` | `any` | no |  |
| `vcenter_password` | `string` | no |  |
| `enable_stretch_cluster` | `bool` | no |  |
| `gen2_subnets_user_defined_routes` | `any` | no |  |
| `lock` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `virtual_network_resource_id` | `string` | no |  |
| `addons` | `any` | no |  |
| `management_cluster_size` | `number` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `private_clouds` -- map (same keys as the input) of every output from each created Azure VMware Solution private clouds.
