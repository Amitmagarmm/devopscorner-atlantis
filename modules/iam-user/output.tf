# ==========================================================================
#  Module IAM User: output.tf
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
  value       = aws_iam_group.devopscorner_developer.name
}

output "devopscorner_developer_group_arn" {
  description = "Developer Group ARN"
  value       = aws_iam_group.devopscorner_developer.arn
}

output "devopscorner_admin_group_name" {
  description = "Administrator Group Name"
  value       = aws_iam_group.devopscorner_administrator.name
}

output "devopscorner_admin_group_arn" {
  description = "Administrator Group ARN"
  value       = aws_iam_group.devopscorner_administrator.arn
}

output "devopscorner_billing_group_name" {
  description = "Billing Group Name"
  value       = aws_iam_group.devopscorner_billing.name
}

output "devopscorner_billing_group_arn" {
  description = "Billing Group ARN"
  value       = aws_iam_group.devopscorner_billing.arn
}

# --------------------------------------------------------------------------
#  List Policy
# --------------------------------------------------------------------------
output "devopscorner_developer_policy" {
  description = "DCI Developer Policy Name"
  value       = aws_iam_policy.devopscorner_developer_policy.name
}

output "devopscorner_developer_policy_arn" {
  description = "DCI Developer Policy ARN"
  value       = aws_iam_policy.devopscorner_developer_policy.arn
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
  Group Name:        ${aws_iam_group.devopscorner_developer.name}
  Group ARN:         ${aws_iam_group.devopscorner_developer.arn}
  Policy Name:       ${aws_iam_policy.devopscorner_developer_policy.name}
  Policy ARN:
    - ${aws_iam_policy.devopscorner_developer_policy.arn}
Administrator:
  Group Name:        ${aws_iam_group.devopscorner_administrator.name}
  Group ARN:         ${aws_iam_group.devopscorner_administrator.arn}
  Policy ARN:
    - ${local.ARN_Policy_AdministratorAccess}
Billing:
  Group Name:        ${aws_iam_group.devopscorner_billing.name}
  Group ARN:         ${aws_iam_group.devopscorner_billing.arn}
  Policy ARN:
    - ${local.ARN_Policy_BillingReadOnlyAccess}
    - ${local.ARN_Policy_ReadOnlyAccess}
SUMMARY
}

output "summary" {
  description = "Summary IAM User Configuration"
  value       = local.summary
}
