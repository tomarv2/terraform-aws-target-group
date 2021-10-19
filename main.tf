# target group
# https://github.com/cloudposse/terraform-aws-alb-ingress/issues/24
resource "aws_lb_target_group" "target_group" {
  count = var.deploy_target_group != false ? length(var.lb_port) : 0


  name     = "${var.teamid}-${var.prjid}-${var.lb_port[count.index]}"
  port     = element(var.lb_port, count.index)
  protocol = var.lb_protocol

  vpc_id = module.global.vpc[local.account_info][local.override_aws_region]
  tags   = merge(local.shared_tags)

  deregistration_delay = var.deregistration_delay
  target_type          = var.target_type

  health_check {
    interval            = var.healthcheck_interval == "" ? null : var.healthcheck_interval
    path                = var.healthcheck_path == "" ? null : var.healthcheck_path
    healthy_threshold   = var.healthy_threshold == "" ? null : var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold == "" ? null : var.unhealthy_threshold
    timeout             = var.healthcheck_timeout == "" ? null : var.healthcheck_timeout
    protocol            = var.lb_protocol == "" ? null : var.lb_protocol
    matcher             = var.healthcheck_matcher == "" ? null : var.healthcheck_matcher
  }

  dynamic "stickiness" {
    for_each = var.stickiness == null ? [] : [var.stickiness]
    content {
      type            = "lb_cookie"
      cookie_duration = stickiness.value.cookie_duration
      enabled         = var.lb_protocol == "TCP" ? false : stickiness.value.enabled
    }
  }
}
