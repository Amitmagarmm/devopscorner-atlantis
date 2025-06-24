# ==========================================================================
#  888899990000 - IAM: iam-variable.tf
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
  default     = "TF-User-Executor-438465168484"
}

# --------------------------------------------------------------------------
#  User Team
# --------------------------------------------------------------------------
variable "dci_team_developer" {
  description = "DCI Developer Team Member"
  type        = list(any)
  default = [
    "developer.01@devopscorner.id",
    "developer.02@devopscorner.id"
  ]
}

variable "dci_team_administrator" {
  description = "DCI Administrator Team Member"
  type        = list(any)
  default = [
    "administrator.01@devopscorner.id",
    "administrator.02@devopscorner.id"
  ]
}

variable "dci_team_billing" {
  description = "CSIRO Developer Team Member"
  type        = list(any)
  default = [
    "billing.01@devopscorner.id",
    "billing.02@devopscorner.id"
  ]
}