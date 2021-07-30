locals {
  subnet_ids = compact(var.subnet_ids)
  security_group_ids = compact(var.security_group_ids)
  is_create_security_group = length(local.security_group_ids) == 0
}

module "ecs" {
  source = "modules/ecs"
  vpc_id = local.vpc_id
  security_group_ids = local.is_create_security_group
  subnet_ids = local.subnet_ids
  is_create_security_group = local.is_create_security_group
  count = var.type == "ecs" ? 1 : 0
}

module "ec2" {
  source = "modules/ec2"
  vpc_id = local.vpc_id
  security_group_ids = var.security_group_ids
  subnet_ids = local.subnet_ids
  is_create_security_group = local.is_create_security_group
  count = var.type == "ec2" ? 1 : 0
}