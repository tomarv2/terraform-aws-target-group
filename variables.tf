variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
}

variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-west-2"
}

variable "account_id" {
  description = "(Required) AWS account id (used to pull values from shared base module like vpc info, subnet ids)"
}

variable "healthcheck_path" {
  description = "target group healthcheck path"
  default = ""
}

variable "lb_port" {
  default  = [80]
}

variable "healthy_threshold" {
  description = "target group healthcheck threshold"
  default     = ""
}

variable "unhealthy_threshold" {
  description = "target group unheathy healthcheck threshold"
  default     = ""
}

variable "healthcheck_timeout" {
  default     = ""
}

variable "healthcheck_interval" {
  default     = ""
}

variable "healthcheck_matcher" {
  description = "healthcheck matcher (e.g. 200)"
  default = ""
}

variable "lb_protocol" {
  default     = "HTTP"
}

variable "alb_cert_arn" {
  description = "alb cert arn"
  default     = ""
}

variable "alb_ssl_policy" {
  description = "alb ssl policy"
  default     = ""
}

variable "alb_action_type" {
  default     = "forward"
}

variable "stickiness" {
  type = object({
    cookie_duration = number
    enabled         = bool
  })
  description = "Target group sticky configuration"
  default     = null
}

variable "deregistration_delay" {
  default = "300"
}

variable "target_type" {
  default = "instance"
}