[![](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

# terraform-aws-target-group
Terraform module for Target Group

## Versions

- Module tested for Terraform 0.14.
- AWS provider version [3.29.0](https://registry.terraform.io/providers/hashicorp/aws/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest tag in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_PROFILE=default
export TF_AWS_BUCKET_REGION=us-west-2
export PATH=$PATH:/usr/local/bin/
```  

- Update:
```
example/custom/sample.tfvars
```

- Change to: 
```
example/base
``` 

- Run and verify the output before deploying:
```
tf -cloud aws plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud aws apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud aws destroy -var-file <path to .tfvars file>
```

Please refer to example directory [link](example/README.md) for references.

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
| target\_group\_arn | n/a |

