output "name" {
  description = "EFS name"
  value       = var.name
}

output "file_system_arn" {
  description = "Amazon Resource Name of the file system"
  value       = aws_efs_file_system.this.arn
}

output "file_system_id" {
  description = "The ID that identifies the file system"
  value       = aws_efs_file_system.this.id
}

output "mount_target_id" {
  description = "The ID of the mount target"
  value       = aws_efs_mount_target.this.*.id
}

output "mount_target_dns_name" {
  description = "The DNS name for the EFS file system"
  value       = aws_efs_mount_target.this.*.dns_name
}
