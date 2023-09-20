module "vpc" {
  source    = "./modules/vpc"
  infra_env = var.environment
  vpc_cidr  = var.vpc_cidr
}

module "web_servers" {
  source           = "./modules/web-servers"
  region           = var.aws_region
  environment_name = var.environment
  instance_type    = var.instance_type
  vpc_id           = module.vpc.vpc_id
  subnets          = module.vpc.vpc_public_subnets_ids
}