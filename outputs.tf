output "arn" {
  description = "Target group ARN"
  value       = [for target_group in aws_lb_target_group.target_group : target_group.arn]
}

output "port" {
  description = "Target group port"
  value       = [for target_group in aws_lb_target_group.target_group : target_group.port]
}
output "config" {
  description = "Target group configuration"
  value       = aws_lb_target_group.target_group
}