output "resource_group_name" {
  description = "Ressursgruppa alle stackene bruker."
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Regionen alt står i."
  value       = azurerm_resource_group.this.location
}

output "vnet_name" {
  description = "Navnet på VNet-et."
  value       = module.vnet.name
}

output "subnet_ids" {
  description = "Subnett-ID per tjeneste."
  value       = { for navn, s in module.subnet : navn => s.subnet_id }
}

output "resource_group_id" {
  description = "Ressursgruppe-IDen til den delte ressursgruppen."
  value       = azurerm_resource_group.this.id
}

output "vnet_id" {
  description = "VNet-IDen til det delte VNet-et."
  value       = module.vnet.vnet_id
}
