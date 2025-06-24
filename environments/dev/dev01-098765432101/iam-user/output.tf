# ==========================================================================
#  098765432101 - IAM: output.tf
# --------------------------------------------------------------------------
#  Description
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - List Group
#    - List Policy
#    - List Role
#    - List User
# ==========================================================================

# --------------------------------------------------------------------------
#  List Group
# --------------------------------------------------------------------------
output "devopscorner_developer_group_name" {
  description = "Developer Group Name"
  value       = module.iam-user.devopscorner_developer_group_name
}

output "devopscorner_developer_group_arn" {
  description = "Developer Group ARN"
  value       = module.iam-user.devopscorner_developer_group_arn
}

output "devopscorner_admin_group_name" {
  description = "Administrator Group Name"
  value       = module.iam-user.devopscorner_admin_group_name
}

output "devopscorner_admin_group_arn" {
  description = "Administrator Group ARN"
  value       = module.iam-user.devopscorner_admin_group_arn
}

output "devopscorner_billing_group_name" {
  description = "Billing Group Name"
  value       = module.iam-user.devopscorner_billing_group_name
}

output "devopscorner_billing_group_arn" {
  description = "Billing Group ARN"
  value       = module.iam-user.devopscorner_billing_group_arn
}

# --------------------------------------------------------------------------
#  List Policy
# --------------------------------------------------------------------------
output "devopscorner_developer_policy" {
  description = "DCI Developer Policy Name"
  value       = module.iam-user.devopscorner_developer_policy
}

output "devopscorner_developer_policy_arn" {
  description = "DCI Developer Policy ARN"
  value       = module.iam-user.devopscorner_developer_policy_arn
}

# --------------------------------------------------------------------------
#  List User
# --------------------------------------------------------------------------
output "list_devopscorner_developer" {
  description = "DCI Developer Account"
  value       = var.dci_team_developer
}

output "list_devopscorner_administrator" {
  description = "DCI Administrator Account"
  value       = var.dci_team_administrator
}

output "list_devopscorner_billing" {
  description = "DCI Billing Account"
  value       = var.dci_team_billing
}

# --------------------------------------------------------------------------
#  Summary
# --------------------------------------------------------------------------
locals {
  summary = <<SUMMARY
Developer:
  Group Name:        ${module.iam-user.devopscorner_developer_group_name}
  Group ARN:         ${module.iam-user.devopscorner_developer_group_arn}
  Policy Name:       ${module.iam-user.devopscorner_developer_policy}
  Policy ARN:
    - ${module.iam-user.devopscorner_developer_policy_arn}
Administrator:
  Group Name:        ${module.iam-user.devopscorner_admin_group_name}
  Group ARN:         ${module.iam-user.devopscorner_admin_group_arn}
Billing:
  Group Name:        ${module.iam-user.devopscorner_billing_group_name}
  Group ARN:         ${module.iam-user.devopscorner_billing_group_arn}
SUMMARY
}

output "summary" {
  description = "Summary IAM User Configuration"
  value       = local.summary
}
