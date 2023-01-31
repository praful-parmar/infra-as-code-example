locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))


  cidr = "10.0.0.0/16"
}

terraform {
  source = "../../..//module/vpc"
}

inputs = {
  name = "${local.account_vars.locals.environment}"
  cidr = local.cidr

  enable_nat_gateway              = true
  enable_vpn_gateway              = false
  single_nat_gateway              = true

  azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets   = [for i in range(0, 2) : cidrsubnet(local.cidr, 8, i)]
  private_subnets  = [for i in range(2, 4) : cidrsubnet(local.cidr, 8, i)]
  database_subnets = [for i in range(4, 6) : cidrsubnet(local.cidr, 8, i)]
}
