output "target_group_arn" {
  description = "Target group arn"
  value       = aws_lb_target_group.target_group.*.arn
}
