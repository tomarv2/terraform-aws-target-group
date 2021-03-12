<p align="center">
    <a href="https://github.com/tomarv2/terraform-aws-target-group/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-aws-target-group/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-aws-target-group" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-target-group/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-target-group" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-target-group/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-aws-target-group" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module for AWS Target Group

## Versions

- Module tested for Terraform 0.14.
- AWS provider version [3.29.0](https://registry.terraform.io/providers/hashicorp/aws/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest     
        <a href="https://github.com/tomarv2/terraform-aws-target-group/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-target-group" /></a>
  in your releases)

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
```  

- Updated `examples` directory with required values. 

- Run and verify the output before deploying:
```
tf -cloud aws plan
```

- Run below to deploy:
```
tf -cloud aws apply
```

- Run below to destroy:
```
tf -cloud aws destroy
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

##### Target Group
```
module "target_group" {
  source = "../"

  email                = "demo@demo.com"
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

