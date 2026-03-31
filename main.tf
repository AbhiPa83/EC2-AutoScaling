module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
}

module "autoscaling" {
  source     = "./modules/autoscaling"
  vpc_id     = module.networking.vpc_id
  subnet_id  = module.networking.subnet_id
  sg_id      = module.networking.sg_id
}