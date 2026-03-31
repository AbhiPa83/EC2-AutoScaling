provider "aws" {
  region = var.region
}

########################
# VPC MODULE
########################
module "vpc" {
  source = "../../modules/vpc"
  cidr = var.vpc_cidr
  azs  = var.azs
}

########################
# SECURITY GROUP MODULE
########################
module "sg" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
}

########################
# LAUNCH TEMPLATE MODULE
########################
module "lt" {
  source = "../../modules/launch_template"
  sg_id = module.sg.sg_id
}

########################
# AUTO SCALING GROUP
########################
module "asg" {
  source = "../../modules/asg"
  subnet_ids = module.vpc.subnet_ids
  lt_id      = module.lt.lt_id
}