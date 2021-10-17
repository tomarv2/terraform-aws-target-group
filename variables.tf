variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-west-2"
  type        = string
}

variable "account_id" {
  description = "(Required) AWS account id (used to pull values from shared base module like vpc info, subnet ids)"
  type        = string
}

variable "healthcheck_path" {
  description = "target group health check path"
  default     = ""
  type        = string
}

variable "lb_port" {
  description = "load balancer port"
  default     = [80]
  type        = list(any)
}

variable "healthy_threshold" {
  description = "target group health check threshold"
  default     = ""
  type        = string
}

variable "unhealthy_threshold" {
  description = "target group unhealthy health check threshold"
  default     = ""
  type        = string
}

variable "healthcheck_timeout" {
  description = "health check timeout"
  default     = ""
  type        = string
}

variable "healthcheck_interval" {
  description = "health check interval"
  default     = ""
  type        = string
}

variable "healthcheck_matcher" {
  description = "healthcheck matcher (e.g. 200)"
  default     = ""
  type        = string
}

variable "lb_protocol" {
  description = "load balancer protocol"
  default     = "HTTP"
  type        = string
}
/*
variable "alb_cert_arn" {
  description = "alb cert arn"
  default     = ""
  type        = string
}

variable "alb_ssl_policy" {
  description = "alb ssl policy"
  default     = ""
  type        = string
}

variable "alb_action_type" {
  description = "alb action type"
  default     = "forward"
  type        = string
}
*/
variable "stickiness" {
  type = object({
    cookie_duration = number
    enabled         = bool
  })
  description = "Target group sticky configuration"
  default     = null
}

variable "deregistration_delay" {
  description = "deregistration delay"
  default     = "300"
  type        = string
}

variable "target_type" {
  description = "target type"
  default     = "instance"
  type        = string
}

variable "deploy_target_group" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}
