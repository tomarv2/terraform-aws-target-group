output "target_group_arn" {
  description = "The arn of the target group"
  value       = aws_lb_target_group.target_group.*.arn
}
