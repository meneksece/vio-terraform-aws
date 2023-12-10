
# to create multiple roles with same ppermissions
resource "aws_iam_role" "multiple_roles" {
  for_each = toset(var.role_names)
  name     = each.key

  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json  # defined in data.tf 
  managed_policy_arns = var.policy_arns  # list in terraform.tfvars defined as a variable in vars.tf

}



# output "managed_policy_arns" {
#   value = aws_iam_role.roles[0].managed_policy_arns
# }





