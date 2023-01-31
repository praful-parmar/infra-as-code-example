locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
}

terraform {
  source = "../../..//module/sg"
}


dependency "vpc" {
  config_path                             = "../vpc"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "destroy"]
  mock_outputs = {
    vpc_id = "temp-value"
  }
}

inputs = {
   vpc_id = dependency.vpc.outputs.vpc_id
   name = "${local.account_vars.locals.default_tags.project}-sg"
   description = "My security group"
   environment = "${local.account_vars.locals.environment}"
}