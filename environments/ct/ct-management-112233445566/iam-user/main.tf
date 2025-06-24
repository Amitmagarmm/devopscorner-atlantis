# ==========================================================================
#  112233445566 - IAM: main.tf
# --------------------------------------------------------------------------
#  Description:
#    Main Terraform Module
# --------------------------------------------------------------------------
#    - Workspace Environment
#    - Common Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  Workspace Environmet
# --------------------------------------------------------------------------
locals {
  env = terraform.workspace
}

# --------------------------------------------------------------------------
#  Global Tags
# --------------------------------------------------------------------------
locals {
  tags = {
    Environment     = "${var.environment[local.env]}"
    Department      = "${var.department}"
    DepartmentGroup = "${var.environment[local.env]}-${var.department}"
    Terraform       = true
  }
}

# --------------------------------------------------------------------------
#  Reuse Module: IAM-User
# --------------------------------------------------------------------------
module "iam-user" {
  source = "../../../../modules//iam-user"

  aws_region                      = var.aws_region
  aws_account_id_source           = var.aws_account_id_source
  aws_account_id_destination      = var.aws_account_id_destination
  aws_account_profile_source      = var.aws_account_profile_source
  aws_account_profile_destination = var.aws_account_profile_destination
  aws_access_key                  = var.aws_access_key
  aws_secret_key                  = var.aws_secret_key
  workspace_name                  = var.workspace_name
  workspace_env                   = var.workspace_env
  environment                     = var.environment
  department                      = var.department
  prefix_name                     = var.prefix_name
  bucket_name                     = var.bucket_name

  group_devopscorner_developer      = var.group_devopscorner_developer
  group_devopscorner_administrator  = var.group_devopscorner_administrator
  group_devopscorner_billing        = var.group_devopscorner_billing
  policy_devopscorner_developer     = var.policy_devopscorner_developer
  policy_devopscorner_administrator = var.policy_devopscorner_administrator
  policy_devopscorner_billing       = var.policy_devopscorner_billing
  tf_user_executor                  = var.tf_user_executor
  dci_team_developer                = var.dci_team_developer
  dci_team_administrator            = var.dci_team_administrator
  dci_team_billing                  = var.dci_team_billing
}
