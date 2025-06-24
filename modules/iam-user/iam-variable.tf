# ==========================================================================
#  Module IAM User: iam-variable.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Variable
# --------------------------------------------------------------------------
#    - Group Developer
#    - Group Administrator
#    - Policy Developer
#    - Policy Administrator
#    - Role Developer
#    - Role Administrator
# ==========================================================================

# --------------------------------------------------------------------------
#  Group Name
# --------------------------------------------------------------------------
variable "prefix_name" {
  description = "Prefix Name"
  type        = string
}

variable "group_devopscorner_developer" {
  description = "Developer Group Name"
  type        = string
}

variable "group_devopscorner_administrator" {
  description = "Administrator Group Name"
  type        = string
}

variable "group_devopscorner_billing" {
  description = "Billing Group Name"
  type        = string
}

# --------------------------------------------------------------------------
#  Policy Name
# --------------------------------------------------------------------------
variable "policy_devopscorner_developer" {
  description = "Developer Policy Name"
  type        = string
}

variable "policy_devopscorner_administrator" {
  description = "Administrator Policy Name"
  type        = string
}

variable "policy_devopscorner_billing" {
  description = "Billing Policy Name"
  type        = string
}

# --------------------------------------------------------------------------
#  TF-User Account
# --------------------------------------------------------------------------
variable "tf_user_executor" {
  description = "TF User Executor"
  type        = string
}

# --------------------------------------------------------------------------
#  S3 Bucket Name
# --------------------------------------------------------------------------
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# --------------------------------------------------------------------------
#  User Team
# --------------------------------------------------------------------------
variable "dci_team_developer" {
  description = "DCI Developer Team Member"
  type        = list(any)
}

variable "dci_team_administrator" {
  description = "DCI Administrator Team Member"
  type        = list(any)
}

variable "dci_team_billing" {
  description = "DCI Billing Team Member"
  type        = list(any)
}