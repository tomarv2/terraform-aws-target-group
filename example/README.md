# Target group module usage

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | (Required) AWS account id (used to pull values from shared base module like vpc info, subnet ids) | `any` | n/a | yes |
| alb\_action\_type | n/a | `string` | `"forward"` | no |
| alb\_cert\_arn | alb cert arn | `string` | `""` | no |
| alb\_ssl\_policy | alb ssl policy | `string` | `""` | no |
| aws\_region | The AWS region to create resources | `string` | `"us-west-2"` | no |
| deregistration\_delay | n/a | `string` | `"300"` | no |
| email | email address to be used for tagging (suggestion: use group email address) | `any` | n/a | yes |
| healthcheck\_interval | n/a | `string` | `""` | no |
| healthcheck\_matcher | healthcheck matcher (e.g. 200) | `string` | `""` | no |
| healthcheck\_path | target group healthcheck path | `string` | `""` | no |
| healthcheck\_timeout | n/a | `string` | `""` | no |
| healthy\_threshold | target group healthcheck threshold | `string` | `""` | no |
| lb\_port | n/a | `list` | <pre>[<br>  80<br>]</pre> | no |
| lb\_protocol | n/a | `string` | `"HTTP"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| profile\_to\_use | Getting values from ~/.aws/credentials | `any` | n/a | yes |
| stickiness | Target group sticky configuration | <pre>object({<br>    cookie_duration = number<br>    enabled         = bool<br>  })</pre> | `null` | no |
| target\_type | n/a | `string` | `"instance"` | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| unhealthy\_threshold | target group unheathy healthcheck threshold | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| securitygroup\_id | The ID of the default security group associated with the ECS container instances. |
