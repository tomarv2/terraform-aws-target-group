<p align="center">
    <a href="https://github.com/tomarv2/terraform-aws-target-group/actions/workflows/pre-commit.yml" alt="Pre commit">
        <img src="https://github.com/tomarv2/terraform-aws-target-group/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-aws-target-group" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-target-group/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-target-group" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-target-group/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-aws-target-group" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for AWS Target Group

### Versions

- Module tested for Terraform 1.0.1.
- AWS provider version [3.74](https://registry.terraform.io/providers/hashicorp/aws/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases.
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-aws-target-group/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-target-group" /></a> ).

---
### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

#### Option 2:

#### Recommended method (store remote state in S3 using prjid and teamid to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export TF_AWS_PROFILE=<profile from ~/.ws/credentials>
```

or

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export AWS_ACCESS_KEY_ID=<aws_access_key_id>
export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
```

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -c=aws plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=aws apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=aws destroy -var='teamid=foo' -var='prjid=bar'
```

**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)
##### Target Group
```
module "target_group" {
  source = "../"

  account_id           = "12345679012"
  lb_protocol          = "HTTP"
  lb_port              = [80]
  healthcheck_path     = "/"
  healthy_threshold    = "2"
  healthcheck_matcher  = "200"
  healthcheck_timeout  = "15"
  unhealthy_threshold  = "3"
  healthcheck_interval = "30"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.74 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.74 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_global"></a> [global](#module\_global) | git::git@github.com:tomarv2/terraform-global.git//aws | v0.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy_target_group"></a> [deploy\_target\_group](#input\_deploy\_target\_group) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | deregistration delay | `string` | `"300"` | no |
| <a name="input_healthcheck_interval"></a> [healthcheck\_interval](#input\_healthcheck\_interval) | health check interval | `string` | `""` | no |
| <a name="input_healthcheck_matcher"></a> [healthcheck\_matcher](#input\_healthcheck\_matcher) | healthcheck matcher (e.g. 200) | `string` | `""` | no |
| <a name="input_healthcheck_path"></a> [healthcheck\_path](#input\_healthcheck\_path) | target group health check path | `string` | `""` | no |
| <a name="input_healthcheck_timeout"></a> [healthcheck\_timeout](#input\_healthcheck\_timeout) | health check timeout | `string` | `""` | no |
| <a name="input_healthy_threshold"></a> [healthy\_threshold](#input\_healthy\_threshold) | target group health check threshold | `string` | `""` | no |
| <a name="input_lb_port"></a> [lb\_port](#input\_lb\_port) | load balancer port | `list(any)` | <pre>[<br>  80<br>]</pre> | no |
| <a name="input_lb_protocol"></a> [lb\_protocol](#input\_lb\_protocol) | load balancer protocol | `string` | `"HTTP"` | no |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_stickiness"></a> [stickiness](#input\_stickiness) | Target group sticky configuration | <pre>object({<br>    cookie_duration = number<br>    enabled         = bool<br>  })</pre> | `null` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | target type | `string` | `"instance"` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_unhealthy_threshold"></a> [unhealthy\_threshold](#input\_unhealthy\_threshold) | target group unhealthy health check threshold | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | Target group arn |
<!-- END_TF_DOCS -->
