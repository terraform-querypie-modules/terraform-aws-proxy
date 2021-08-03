locals {
  type                      = var.type
  vpc_id                    = var.vpc_id
  subnet_ids                = compact(var.subnet_ids)
  security_group_ids        = compact(var.security_group_ids)
  api_url                   = var.api_url
  cpu                       = var.cpu
  memory                    = var.memory
  port                      = var.port
  cluster_id                = var.cluster_id
  otl_server_tunneling_port = var.otl_server_tunneling_port
  otl_server_listening_port = var.otl_server_listening_port
  proxy_port_start          = var.proxy_port_start
  proxy_port_end            = var.proxy_port_end
  timezone                  = var.timezone
  task_execute_role_arn     = var.task_execute_role_arn
  image_pull_secret_arn     = var.image_pull_secret_arn
  log_group_name            = var.log_group_name
  image                     = var.image
}

module "ecs" {
  source                = "./modules/ecs"
  vpc_id                = local.vpc_id
  security_group_ids    = local.security_group_ids
  subnet_ids            = local.subnet_ids
  count                 = local.type == "ecs" ? 1 : 0
  image                 = local.image
  api_url               = local.api_url
  cluster_id            = local.cluster_id
  port                  = local.port
  proxy_port_start      = local.proxy_port_start
  proxy_port_end        = local.proxy_port_end
  timezone              = local.timezone
  task_execute_role_arn = local.task_execute_role_arn
  image_pull_secret_arn = local.image_pull_secret_arn
  log_group_name        = local.log_group_name
}

module "ec2" {
  source             = "./modules/ec2"
  vpc_id             = local.vpc_id
  security_group_ids = var.security_group_ids
  subnet_ids         = local.subnet_ids
  count              = local.type == "ec2" ? 1 : 0
}