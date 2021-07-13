variable "name" {
  description = "The name to identify resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC id to create security group for EFS"
  type        = string
}

variable "security_group_ids" {
  description = "The list of security group ids separated by comma to allow access EFS port"
  type        = list(string)
}

variable "file_system_encrypted" {
  description = "The EFS disk will be encrypted"
  type        = bool
  default     = false
}

variable "file_system_performance_mode" {
  description = "The file system performance mode"
  type        = string
  default     = "generalPurpose"
}

variable "file_system_creation_token" {
  description = "A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation"
  type        = string
  default     = null
}

variable "mount_target_subnet_ids" {
  description = "The list of subnet ids separated by comma of the subnet to add the mount target in"
  type        = list(string)
}

variable "tags" {
  description = "Map of string for aditional tags to add in all resources"
  type        = map(string)
  default     = {}
}
