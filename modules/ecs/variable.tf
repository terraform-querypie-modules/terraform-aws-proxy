variable "image" {
  type        = string
  default     = "dockerpie.querypie.com/chequer.io/querypie-app:latest"
  description = "querypie image tag"
}

variable "vpc_id" {
  default     = null
  description = "a deployed vpc id"
}

variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = "a deployed subnet ids, it must be attached vpc_id"
}

variable "security_group_ids" {
  type        = list(string)
  default     = null
  description = "attached security_group at querypie proxy"
}

variable "api_url" {
  type    = string
  default = null
  validation {
    condition     =  var.api_url != null
    error_message = "Make sure your input value, the conditions satisfied."
  }
}

variable "task_execute_role_arn" {
  type = string
  default = null
  validation {
    condition     = var.task_execute_role_arn != null
    error_message = "Make sure your input value, the conditions satisfied."
  }
}

variable "image_pull_secret_arn" {
  type = string
  default =  null
  validation {
    condition = var.image_pull_secret_arn != null
    error_message = "Make sure your input value, the conditions satisfied."
  }
}

variable "cluster_id" {
  type    = string
  default = null
  validation {
    condition     = var.cluster_id != null
    error_message = "Make sure your input value, the conditions satisfied."
  }
}

variable "cpu" {
  type    = number
  default = 2048
}

variable "memory" {
  type    = number
  default = 4096
}

variable "port" {
  type    = number
  default = 3000
}

variable "otl_server_listening_port" {
  type        = number
  default     = 6000
  description = "server listening port, that served rest api"
}

variable "otl_server_tunneling_port" {
  type        = number
  default     = 7000
  description = "server tunneling port, that will be connect otl client"
}

variable "proxy_port_start" {
  type        = number
  default     = 40000
  description = "server proxy start port"
}

variable "proxy_port_end" {
  type        = number
  default     = 40300
  description = "server proxy end port"
}

variable "timezone" {
  type        = string
  default     = "Asia/Seoul"
  description = "setting timezone"
}