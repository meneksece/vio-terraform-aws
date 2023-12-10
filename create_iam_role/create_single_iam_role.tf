

# to create new single role, use below
resource "aws_iam_role" "single_role" {
  name     = "ec2-kops-role"

  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = var.policy_arns

}

output "managed_policy_arns" {
  value = aws_iam_role.single_role.managed_policy_arns
}
