resource "aws_lb_target_group" "target_group" {
  for_each = var.config

  name                 = each.key
  port                 = each.value.port
  protocol             = each.value.protocol
  vpc_id               = try(each.value.vpc_id, module.global.vpc[local.account_id][local.region])
  tags                 = merge(local.shared_tags, var.extra_tags)
  deregistration_delay = try(each.value.deregistration_delay, "300")
  target_type          = try(each.value.target_type, "instance")

  health_check {
    interval            = try(each.value.healthcheck_interval, null)
    path                = try(each.value.healthcheck_path, null)
    healthy_threshold   = try(each.value.healthy_threshold, null)
    unhealthy_threshold = try(each.value.unhealthy_threshold, null)
    timeout             = try(each.value.healthcheck_timeout, null)
    protocol            = try(each.value.lb_protoco, null)
    matcher             = try(each.value.healthcheck_matcher, null)
  }

  dynamic "stickiness" {
    for_each = try(each.value.stickiness, null) == null ? [] : [each.value.stickiness]
    content {
      type            = "lb_cookie"
      cookie_duration = stickiness.value.cookie_duration
      enabled         = try(each.value.protocol, null) == "TCP" ? false : stickiness.value.enabled
    }
  }
}
