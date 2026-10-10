output "private_clouds" {
  description = "Map (same keys as var.private_clouds) of every output from each Azure VMware Solution private clouds created -- see upstream module docs for the full shape."
  value       = module.private_cloud
}
