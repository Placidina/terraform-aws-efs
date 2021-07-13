resource "aws_security_group" "this" {
  name        = var.name
  description = "EFS Access Port"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = var.security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({
    Name = var.name
  }, var.tags)
}

resource "aws_efs_file_system" "this" {
  encrypted        = var.file_system_encrypted
  performance_mode = var.file_system_performance_mode
  creation_token   = var.file_system_creation_token

  tags = merge({
    Name = var.name
  }, var.tags)
}

resource "aws_efs_mount_target" "this" {
  count = length(var.mount_target_subnet_ids)

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.mount_target_subnet_ids[count.index]
  security_groups = tolist([aws_security_group.this.id])
}
