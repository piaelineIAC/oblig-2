tjeneste       = "ordre"
runtime        = "vm"
prefix         = "10.20.0.0/24"
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMQ32gu8mGVI86gkUex5JsBeg7WC58bsUOVuxmeHDJW oblig2-ingen-privat-nokkel"

extra_rules = [
  {
    name     = "allow-8520"
    priority = 110
    port     = 8520
    source   = "172.16.14.0/24"
  }
]