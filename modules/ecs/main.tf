locals {
  vpc_id                      = var.vpc_id
  subnet_ids                  = var.subnet_ids
  is_enable_high_availability = var.ha
  image                       = var.image
  high_availability           = length(local.subnet_ids) > 2
  cpu                         = 2
  memory                      = 2048
  log_group = var.log_group
  ecs_provider = capacity_providers

}

resource "aws_ecs_cluster" "this" {
  name = "proxy"

  capacity_providers = ["FARGATE"]

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"
    }

    log_configuration {
      cloud_watch_log_group_name = local.log_group
    }
  }
}

resource "aws_ecs_task_definition" "this" {
  container_definitions = jsonencode([{
    name      = proxy
    image     = local.image
    cpu       = local.memory
    memory    = local.cpu
    essential = true
  }])
  family = "proxy"
}