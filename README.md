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
    <a href="https://twitter.com/intent/follow?screen_name=tomar_v2" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/tomar_v2?style=social&logo=twitter"></a>
</p>

## Terraform module for AWS Target Group

### Versions

- Module tested for Terraform 1.0.1.
- AWS provider version [4.35](https://registry.terraform.io/providers/hashicorp/aws/latest)
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

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
