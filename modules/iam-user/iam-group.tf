# ==========================================================================
#  Module IAM User: iam-group.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Group Name
# --------------------------------------------------------------------------
#    - Group Developer
#    - Group Administrator
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM Group
# --------------------------------------------------------------------------
resource "aws_iam_group" "devopscorner_developer" {
  provider = aws.destination
  name     = "${var.group_devopscorner_developer}_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
}

resource "aws_iam_group" "devopscorner_administrator" {
  provider = aws.destination
  name     = "${var.group_devopscorner_administrator}_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
}

resource "aws_iam_group" "devopscorner_billing" {
  provider = aws.destination
  name     = "${var.group_devopscorner_billing}_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
}
