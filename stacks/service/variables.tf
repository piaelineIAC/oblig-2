variable "kortnavn" {
  description = "Kortnavnet ditt fra felles konfigurasjon."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{2,10}$", var.kortnavn))
    error_message = "Kortnavnet må være 2–10 små bokstaver eller tall."
  }
}

variable "location" {
  description = "Azure-regionen."
  type        = string
}

variable "miljo" {
  description = "Miljøet: dev eller prod."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.miljo)
    error_message = "Miljøet må være dev eller prod."
  }
}

variable "tjeneste" {
  description = "Navnet på tjenesten."
  type        = string
}

variable "runtime" {
  description = "Kjøremiljø: vm eller webapp."
  type        = string

  validation {
    condition     = contains(["vm", "webapp"], var.runtime)
    error_message = "Kjøremiljøet må være vm eller webapp."
  }
}

variable "prefix" {
  description = "Adresseområdet til tjenestens subnett."
  type        = string
}

variable "allow_http_from" {
  description = "Hvem som kan nå tjenesten på port 80."
  type        = string
  default     = "Internet"
}

variable "vm_size" {
  description = "Størrelsen på VM-en når runtime er vm."
  type        = string
  default     = "Standard_B2als_v2"
}

variable "ssh_public_key" {
  description = "Offentlig SSH-nøkkel til VM-en."
  type        = string
}

variable "webapp_sku" {
  description = "SKU for App Service-planen når runtime er webapp."
  type        = string
  default     = "B1"
}

variable "state_resource_group_name" {
  description = "Ressursgruppen til state-kontoen."
  type        = string
}

variable "state_storage_account_name" {
  description = "Navnet på state-kontoen."
  type        = string
}

variable "state_container_name" {
  description = "Containeren som inneholder state-filene."
  type        = string
}

variable "extra_rules" {
  description = "Ekstra regler for NSG-en til tjenesten."
  type = list(object({
    name     = string
    priority = number
    port     = number
    source   = string
  }))
  default = []
}