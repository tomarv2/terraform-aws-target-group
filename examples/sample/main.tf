provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

module "target_group" {
  source = "../../"

  account_id           = "12345679012"
  lb_protocol          = "HTTP"
  lb_port              = [80]
  healthcheck_path     = "/"
  healthy_threshold    = "2"
  healthcheck_matcher  = "200"
  healthcheck_timeout  = "15"
  unhealthy_threshold  = "3"
  healthcheck_interval = "30"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
