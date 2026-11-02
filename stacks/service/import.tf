locals {
  resource_group_id = local.network.resource_group_id
  vnet_id           = local.network.vnet_id

  subnet_id = "${local.vnet_id}/subnets/snet-${var.tjeneste}"
  nsg_id    = "${local.resource_group_id}/providers/Microsoft.Network/networkSecurityGroups/nsg-${var.tjeneste}"
}

import {
  to = module.subnet.azurerm_subnet.this
  id = local.subnet_id
}

import {
  to = module.subnet.azurerm_network_security_group.this
  id = local.nsg_id
}

import {
  to = module.subnet.azurerm_network_security_rule.http
  id = "${local.nsg_id}/securityRules/allow-http"
}

import {
  to = module.subnet.azurerm_subnet_network_security_group_association.this
  id = local.subnet_id
}

# Data: storage account og Key Vault.

import {
  to = module.storage.azurerm_storage_account.this
  id = "${local.resource_group_id}/providers/Microsoft.Storage/storageAccounts/st${var.kortnavn}${var.tjeneste}${var.miljo}"
}

import {
  to = module.keyvault.azurerm_key_vault.this
  id = "${local.resource_group_id}/providers/Microsoft.KeyVault/vaults/kv-${var.kortnavn}-${var.tjeneste}-${var.miljo}"
}

import {
  for_each = var.runtime == "vm" ? toset(["vm"]) : toset([])

  to = module.vm[0].azurerm_public_ip.this
  id = "${local.resource_group_id}/providers/Microsoft.Network/publicIPAddresses/pip-${var.tjeneste}"
}

import {
  for_each = var.runtime == "vm" ? toset(["vm"]) : toset([])

  to = module.vm[0].azurerm_network_interface.this
  id = "${local.resource_group_id}/providers/Microsoft.Network/networkInterfaces/nic-${var.tjeneste}"
}

import {
  for_each = var.runtime == "vm" ? toset(["vm"]) : toset([])

  to = module.vm[0].azurerm_linux_virtual_machine.this
  id = "${local.resource_group_id}/providers/Microsoft.Compute/virtualMachines/vm-${var.tjeneste}"
}

import {
  for_each = var.runtime == "webapp" ? toset(["webapp"]) : toset([])

  to = module.webapp[0].azurerm_service_plan.this
  id = "${local.resource_group_id}/providers/Microsoft.Web/serverFarms/asp-${var.tjeneste}"
}

import {
  for_each = var.runtime == "webapp" ? toset(["webapp"]) : toset([])

  to = module.webapp[0].azurerm_linux_web_app.this
  id = "${local.resource_group_id}/providers/Microsoft.Web/sites/app-${var.kortnavn}-${var.tjeneste}-${var.miljo}"
}