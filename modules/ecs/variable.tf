variable "type" {
  type = string
  default = null
  description = "ecs"
}

variable "ha" {

}

variable "image" {
  type = string
  default = "dockerpie.querypie.com/chequer.io/"
}

variable "vpc_id" {
  default = null
  description = "a deployed vpc id"
}

variable "subnet_ids" {
  type = list(string)
  default = null
  description = "a deployed subnet ids, it must be attached vpc_id"
}

variable "security_group_ids" {
  type = list(strings)
  default = null
  description = "attached security_group at querypie proxy"
}