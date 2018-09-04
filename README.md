# Epsagon Terraform AWS Integration

Setup Epsagon <-> AWS integration module

This module provides the ability to setup Epsagon integration via Terraform. This module will setup the following:

- Cross account IAM role for Epsagon

## Usage

To use this module you need to create a Terraform configuration that utilizes this module. A basic example configuration would look as follows (Be sure to adjust the git ref in the source value appropriately):

```hcl
module "epsagon_aws_integration" {
  source                    = "github.com/dgoradia/epsagon-terraform?ref=v0.1.0"
  epsagon_account_id        = "<EPSAGON_AWS_ACCOUNT_ID>"
  epsagon_external_id       = "<EPSAGON_AWS_EXTERNAL_ID>"
}

output "epsagon_iam_role_arn" {
  value = "${module.epsagon_aws_integration.iam_role_arn}"
}
```

Run Terraform and get the output IAM role ARN from it.

## Outputs

- **_iam_role_arn:_** ARN of cross account IAM role granting Epsagon access to environment. (Enter this value into Epsagon when setting up.)
