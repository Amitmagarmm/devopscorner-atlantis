# ==========================================================================
#  Module IAM User: iam-policy.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Policy
# --------------------------------------------------------------------------
#    - Policy Administrator
#    - Policy Developer
# ==========================================================================

locals {
  ARN_Policy_AdministratorAccess   = "arn:aws:iam::aws:policy/AdministratorAccess"
  ARN_Policy_ReadOnlyAccess        = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ARN_Policy_BillingReadOnlyAccess = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"


  # --------------------------------------------------------------------------
  #  Customize Policy
  # --------------------------------------------------------------------------
  Policy_Developer = {
    "Version" : "2012-10-17",
    "Statement" : [
      # --------------------------------------------------------------------------
      #  CloudWatch Policy
      # --------------------------------------------------------------------------
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudwatch:PutMetricData",
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:ListMetrics",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ],
        "Resource" : "*"
      },
      # --------------------------------------------------------------------------
      #  SSM Policy
      # --------------------------------------------------------------------------
      {
        "Effect" : "Allow",
        "Action" : [
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath"
        ],
        "Resource" : "arn:aws:ssm:${var.aws_region}:${var.aws_account_id_destination}:parameter/${var.prefix_name}/${var.workspace_env[local.env]}/*"
      },
      # --------------------------------------------------------------------------
      #  Auto-Scalling-Group (ASG) Policy
      # --------------------------------------------------------------------------
      {
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeTags"
        ],
        "Resource" : "*"
      },
      # --------------------------------------------------------------------------
      #  EC2 Instance Policy
      # --------------------------------------------------------------------------
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstanceStatus"
        ],
        "Resource" : "*"
      },
      # --------------------------------------------------------------------------
      #  S3 Policy
      # --------------------------------------------------------------------------
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  }
}

# --------------------------------------------------------------------------
#  Identity Policy
# --------------------------------------------------------------------------
resource "aws_iam_policy" "devopscorner_developer_policy" {
  provider    = aws.destination
  name        = "${var.policy_devopscorner_developer}_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
  path        = "/"
  description = "DCI Policy for Developer"

  policy = jsonencode(
    merge(
      local.Policy_Developer
    ),
  )

  tags = local.tags
}

# --------------------------------------------------------------------------
#  Bind Group - Policy
# --------------------------------------------------------------------------
# Group: devopscorner-developer
resource "aws_iam_group_policy_attachment" "policy_developer_group" {
  policy_arn = aws_iam_policy.devopscorner_developer_policy.arn
  group      = aws_iam_group.devopscorner_developer.name
}

# Group: devopscorner-administrator
resource "aws_iam_group_policy_attachment" "policy_administrator_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AdministratorAccess
  group      = aws_iam_group.devopscorner_administrator.name
}

# Group: devopscorner-billing
resource "aws_iam_group_policy_attachment" "policy_billing_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_BillingReadOnlyAccess
  group      = aws_iam_group.devopscorner_billing.name
}

resource "aws_iam_group_policy_attachment" "policy_readonly_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_ReadOnlyAccess
  group      = aws_iam_group.devopscorner_billing.name
}