terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.63"
    }
  }
}

provider "aws" {
  region = var.region
}

module "target_group" {
  source = "../../"

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
