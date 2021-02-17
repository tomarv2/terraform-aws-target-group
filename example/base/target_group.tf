module "target_group" {
  source                        = "../.."

  email                         = var.email
  teamid                        = var.teamid
  prjid                         = var.prjid
  profile_to_use                = var.profile_to_use
  account_id                    = var.account_id
  aws_region                    = var.aws_region
  lb_protocol                   = var.lb_protocol
  lb_port                       = var.lb_port
  healthcheck_path              = var.healthcheck_path
  healthy_threshold             = var.healthy_threshold
  healthcheck_matcher           = var.healthcheck_matcher
  healthcheck_timeout           = var.healthcheck_timeout
  unhealthy_threshold           = var.unhealthy_threshold
  healthcheck_interval          = var.healthcheck_interval
}

