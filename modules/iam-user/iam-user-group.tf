# ==========================================================================
#  Module IAM User: iam-user-group.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Grouping User
# --------------------------------------------------------------------------
#    - Group Administrator
#    - Group Developer
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM User Group Developer
# --------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "devopscorner_developer" {
  provider = aws.destination
  for_each = toset(
    local.dci_team_developer
  )

  user = lower(each.key)

  groups = [
    aws_iam_group.devopscorner_developer.name,
  ]
}

# --------------------------------------------------------------------------
#  IAM User Group Administrator
# --------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "dci_team_administrator" {
  provider = aws.destination
  for_each = toset(
    local.dci_team_administrator
  )

  user = lower(each.key)

  groups = [
    aws_iam_group.devopscorner_administrator.name,
  ]
}

# --------------------------------------------------------------------------
#  IAM User Group Billing
# --------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "dci_team_billing" {
  provider = aws.destination
  for_each = toset(
    local.dci_team_billing
  )

  user = lower(each.key)

  groups = [
    aws_iam_group.devopscorner_billing.name,
  ]
}
