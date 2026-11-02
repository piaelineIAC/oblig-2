locals {
  tags = {
    eier  = var.kortnavn
    miljo = var.miljo
    kurs  = "dcst3005-oblig2"
  }
}

data "azurerm_resource_group" "existing" {
  name = "rg-${var.kortnavn}-oblig2-${var.miljo}"
}

data "azurerm_virtual_network" "existing" {
  name                = "vnet-${var.kortnavn}-${var.miljo}"
  resource_group_name = data.azurerm_resource_group.existing.name
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${var.kortnavn}-oblig2-${var.miljo}"
  location = var.location
  tags     = local.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = "vnet-${var.kortnavn}-${var.miljo}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = var.address_space
  tags                = local.tags
}

import {
  to = azurerm_resource_group.this
  id = data.azurerm_resource_group.existing.id
}

import {
  to = module.vnet.azurerm_virtual_network.this
  id = data.azurerm_virtual_network.existing.id
}