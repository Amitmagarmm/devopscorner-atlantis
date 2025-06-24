# Terraform Module IAM User

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.77.0 |
| <a name="provider_aws.destination"></a> [aws.destination](#provider\_aws.destination) | 5.77.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.devopscorner_administrator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.devopscorner_billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.devopscorner_developer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.policy_administrator_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.policy_billing_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.policy_developer_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.policy_readonly_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.devopscorner_developer_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.devopscorner_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.devopscorner_billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.devopscorner_developer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.devopscorner_developer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_group_membership.dci_team_administrator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_group_membership.dci_team_billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | n/a | yes |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy the Budget in | `string` | n/a | yes |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | n/a | yes |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy the Budget in | `string` | n/a | yes |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | n/a | yes |
| <a name="input_dci_team_administrator"></a> [devopscorner\_team\_administrator](#input\_devopscorner\_team\_administrator) | DCI Administrator Team Member | `list(any)` | n/a | yes |
| <a name="input_dci_team_billing"></a> [devopscorner\_team\_billing](#input\_devopscorner\_team\_billing) | DCI Billing Team Member | `list(any)` | n/a | yes |
| <a name="input_dci_team_developer"></a> [devopscorner\_team\_developer](#input\_devopscorner\_team\_developer) | DCI Developer Team Member | `list(any)` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket | `string` | n/a | yes |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | n/a | yes |
| <a name="input_group_devopscorner_administrator"></a> [group\_devopscorner\_administrator](#input\_group\_devopscorner\_administrator) | Administrator Group Name | `string` | n/a | yes |
| <a name="input_group_devopscorner_billing"></a> [group\_devopscorner\_billing](#input\_group\_devopscorner\_billing) | Billing Group Name | `string` | n/a | yes |
| <a name="input_group_devopscorner_developer"></a> [group\_devopscorner\_developer](#input\_group\_devopscorner\_developer) | Developer Group Name | `string` | n/a | yes |
| <a name="input_policy_devopscorner_administrator"></a> [policy\_devopscorner\_administrator](#input\_policy\_devopscorner\_administrator) | Administrator Policy Name | `string` | n/a | yes |
| <a name="input_policy_devopscorner_billing"></a> [policy\_devopscorner\_billing](#input\_policy\_devopscorner\_billing) | Billing Policy Name | `string` | n/a | yes |
| <a name="input_policy_devopscorner_developer"></a> [policy\_devopscorner\_developer](#input\_policy\_devopscorner\_developer) | Developer Policy Name | `string` | n/a | yes |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | Prefix Name | `string` | n/a | yes |
| <a name="input_tf_user_executor"></a> [tf\_user\_executor](#input\_tf\_user\_executor) | TF User Executor | `string` | n/a | yes |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_devopscorner_admin_group_arn"></a> [devopscorner\_admin\_group\_arn](#output\_devopscorner\_admin\_group\_arn) | Administrator Group ARN |
| <a name="output_devopscorner_admin_group_name"></a> [devopscorner\_admin\_group\_name](#output\_devopscorner\_admin\_group\_name) | Administrator Group Name |
| <a name="output_devopscorner_billing_group_arn"></a> [devopscorner\_billing\_group\_arn](#output\_devopscorner\_billing\_group\_arn) | Billing Group ARN |
| <a name="output_devopscorner_billing_group_name"></a> [devopscorner\_billing\_group\_name](#output\_devopscorner\_billing\_group\_name) | Billing Group Name |
| <a name="output_devopscorner_developer_group_arn"></a> [devopscorner\_developer\_group\_arn](#output\_devopscorner\_developer\_group\_arn) | Developer Group ARN |
| <a name="output_devopscorner_developer_group_name"></a> [devopscorner\_developer\_group\_name](#output\_devopscorner\_developer\_group\_name) | Developer Group Name |
| <a name="output_devopscorner_developer_policy"></a> [devopscorner\_developer\_policy](#output\_devopscorner\_developer\_policy) | DCI Developer Policy Name |
| <a name="output_devopscorner_developer_policy_arn"></a> [devopscorner\_developer\_policy\_arn](#output\_devopscorner\_developer\_policy\_arn) | DCI Developer Policy ARN |
| <a name="output_list_devopscorner_administrator"></a> [list\_devopscorner\_administrator](#output\_list\_devopscorner\_administrator) | DCI Administrator Account |
| <a name="output_list_devopscorner_billing"></a> [list\_devopscorner\_billing](#output\_list\_devopscorner\_billing) | DCI Billing Account |
| <a name="output_list_devopscorner_developer"></a> [list\_devopscorner\_developer](#output\_list\_devopscorner\_developer) | DCI Developer Account |
| <a name="output_summary"></a> [summary](#output\_summary) | Summary IAM User Configuration |
<!-- END_TF_DOCS -->