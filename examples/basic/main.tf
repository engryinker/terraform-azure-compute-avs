terraform {
  required_version = ">= 1.7.0"
}

module "compute-avs" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  private_clouds = {} # see README Inputs table / upstream module docs for the per-entry schema
}
