#################
# core compnents
#################

module "vnet" {
  source= "../core_modules/vnet"
    vnet_name   = "core_vnet"
    vnet_ip     = "10.0.0.0/16"
}