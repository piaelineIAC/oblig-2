output "resource_group_name" {
  description = "Ressursgruppa alle stackene bruker."
  value       = data.azurerm_resource_group.existing.name
}

output "location" {
  description = "Regionen alt står i."
  value       = data.azurerm_resource_group.existing.location
}

output "vnet_name" {
  description = "Navnet på VNet-et."
  value       = data.azurerm_virtual_network.existing.name
}

output "subnet_ids" {
  description = "Subnett-ID per tjeneste."
  value       = { for navn, s in data.azurerm_subnet.existing : navn => subnett.id }
}

output "resource_group_id" {
  description = "Ressursgruppe-IDen til den delte ressursgruppen."
  value       = data.azurerm_resource_group.existing.id
}

output "vnet_id" {
  description = "VNet-IDen til det delte VNet-et."
  value       = data.azurerm_virtual_network.existing.id
}
