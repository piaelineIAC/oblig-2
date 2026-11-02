# Nettverkslaget for ALLE tjenestene: ressursgruppa, VNet-et, og ett subnett
# med NSG per tjeneste.

data "azurerm_resource_group" "existing" {
  name = "rg-${var.kortnavn}-oblig2-${var.miljo}"
}

data "azurerm_virtual_network" "existing" {
  name                = "vnet-${var.kortnavn}-${var.miljo}"
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_subnet" "existing" {
  for_each = var.tjenester

  name                 = "snet-${each.key}"
  virtual_network_name = data.azurerm_virtual_network.existing.name
  resource_group_name  = data.azurerm_resource_group.existing.name
}

removed {
  from = module.subnet

  lifecycle {
    destroy = false
  }
}

