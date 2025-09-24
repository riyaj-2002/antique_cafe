module "vpc" {
  source                     = "../modules/vpc"
  aws_region                 = var.aws_region
  project_name               = var.project_name
  vpc_cidr                   = var.vpc_cidr
  cidr_block_public_subnet_1 = var.cidr_block_public_subnet_1
  cidr_block_public_subnet_2 = var.cidr_block_public_subnet_2
  cidr_block_private_subnet_1 = var.cidr_block_private_subnet_1
  cidr_block_private_subnet_2 = var.cidr_block_private_subnet_2
  cidr_block_private_subnet_3 = var.cidr_block_private_subnet_3
  cidr_block_private_subnet_4 = var.cidr_block_private_subnet_4
}

module "nat" {
  source            = "../modules/nat"
  public_subnet_1_id  = module.vpc.public_subnet_ids[0]
  public_subnet_2_id  = module.vpc.public_subnet_ids[1]
  private_subnet_1_id = module.vpc.private_subnet_ids[0]
  private_subnet_2_id = module.vpc.private_subnet_ids[1]
  private_subnet_3_id = module.vpc.private_subnet_ids[2]
  private_subnet_4_id = module.vpc.private_subnet_ids[3]
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.vpc.igw_id
  project_name        = var.project_name
}

module "security_group" {
  source       = "../modules/security_group"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "key" {
  source       = "../modules/key"
  project_name = var.project_name
}

module "elb" {
  source             = "../modules/elb"
  project_name       = var.project_name
  elb_sg_id         = module.security_group.elb_sg_id
  public_subnet_1_id = module.vpc.public_subnet_ids[0]
  public_subnet_2_id = module.vpc.public_subnet_ids[1]
  vpc_id             = module.vpc.vpc_id
}

module "asg" {
  source                = "../modules/asg"
  project_name          = var.project_name
  key_pair_name         = module.key.key_pair_name
  client_sg_id          = module.security_group.client_sg_id
  cpu                   = "t2.micro"
  max_size              = 6
  min_size              = 2
  desired_cap           = 3
  asg_health_check_type = "ELB"
  private_subnet_1_id   = module.vpc.private_subnet_ids[0]
  private_subnet_3_id   = module.vpc.private_subnet_ids[2]
  elb_name               = module.elb.elb_name
}

module "rds" {
  source             = "../modules/rds"
  project_name       = var.project_name
  db_sg_id           = module.security_group.db_sg_id
  private_subnet_2_id = module.vpc.private_subnet_ids[1]
  private_subnet_4_id = module.vpc.private_subnet_ids[3]
  db_username        = var.db_username
  db_password        = var.db_password
}

module "s3" {
  source       = "../modules/s3"
  project_name = var.project_name
}
