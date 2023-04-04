terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.61"
    }
  }
}

provider "aws" {
  region = var.region
}

module "target_group" {
  source = "../"

  config = {
    demotg = {
      protocol             = "HTTP"
      port                 = 80
      healthcheck_path     = "/"
      healthy_threshold    = "2"
      healthcheck_matcher  = "200"
      healthcheck_timeout  = "15"
      unhealthy_threshold  = "3"
      healthcheck_interval = "30"
    }
    demotg1 = {
      protocol             = "HTTP"
      port                 = 80
      healthcheck_path     = "/"
      healthy_threshold    = "2"
      healthcheck_matcher  = "200"
      healthcheck_timeout  = "15"
      unhealthy_threshold  = "3"
      healthcheck_interval = "30"
    }
  }
  teamid = var.teamid
  prjid  = var.prjid
}
