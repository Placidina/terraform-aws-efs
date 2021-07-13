# AWS Elastic File System (EFS) Terraform Module

Terraform module which creates Elastic File System resources on AWS.

Available features:

- Security Group - either created by the module
- Elastic File System - either created by the module
- Elastic File System Mount Target - either created by the module

## Usage

```hcl
module "efs" {
    source  = "Placidina/efs/aws"
    version = "~> 0.1.0"

    name = "example-efs"

    vpc_id                  = "vpc-000000000000"
    security_group_ids      = ["sg-0000000000", "sg-111111111111"]
    mount_target_subnet_ids = ["subnet-000000000", "subnet-11111111111", "subnet-2222222222"]

    tags = {
        Billing = "example"
    }
}
```

## Requirements

| Name | Version |
|---|---|
| [terraform](https://www.terraform.io/downloads.html) | >= 1.0.0 |


## Providers

| Name | Version |
|---|---|
| [local](https://registry.terraform.io/providers/hashicorp/local/latest) | >= 2.1.0 |
| [aws](https://registry.terraform.io/providers/hashicorp/aws/latest) | >= 3.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|---|---|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_efs_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|---|---|--|--|--|
| <a name="input_name"></a> [name](#input\_name) | The name to identify all resources | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc_id](#input\_vpc\_id) | The VPC ID to create security group for EFS | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security_group_ids](#input\_security\_group\_ids) | The list of security group ids to allow access EFS port | `list(string)` | n/a | yes |
| <a name="input_file_system_encrypted"></a> [file_system_encrypted](#input\_file\_system\_encrypted) | The EFS disk will be encrypted | `bool` | `false` | no |
| <a name="input_file_system_performance_mode"></a> [file_system_performance_mode](#input\_file\_system\_performance\_mode) | The file system performance mode | `string` | `"generalPurpose"` | no |
| <a name="input_file_system_creation_token"></a> [file_system_creation_token](#input\_file\_system\_creation\_token) | A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation | `string` | `null` | no |
| <a name="input_mount_target_subnet_ids"></a> [mount_target_subnet_ids](#input\_mount\_target\_subnet\_ids) | The list of subnet ids to mount target in | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of string for aditional tags to add in all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|---|---|
| <a name="input_file_system_arn"></a> [file_system_arn](#input\_file\_system\_arn) | Amazon Resource Name of the file system |
| <a name="input_file_system_id"></a> [file_system_id](#input\_file\_system\_id) | The ID that identifies the file system |
| <a name="input_mount_target_id"></a> [mount_target_id](#input\_mount\_target\_id) | The ID of the mount target |
| <a name="input_mount_target_dns_name"></a> [mount_target_dns_name](#input\_mount\_target\_dns\_name) | The DNS name for the EFS file system |

## Authors

Module is maintained by [Alan Placidina Maria](https://github.com/Placidina).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/Placidina/terraform-aws-efs-module/tree/master/LICENSE) for full details.