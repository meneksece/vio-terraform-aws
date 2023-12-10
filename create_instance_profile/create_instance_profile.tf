# you may want to create a brand new role and instance profile, uncomment this block
# resource "aws_iam_role" "single_role" {
#   #count = contains(data.aws_iam_roles.all_roles.names , var.aws_iam_role) ? 0 : 1 # Only create if the role doesn't exist, but it destroys the existing one....
#   name     = var.aws_iam_role  #existing one is ec2-kops-role
#   assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
#   managed_policy_arns = var.policy_arns

# }

# output "name" {
#   value = aws_iam_role.single_role
# }


# create instance profile with role
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile2"
  # role = aws_iam_role.single_role_new.name
  role = var.aws_iam_role

}


# output "iam_role_names" {
#   value = data.aws_iam_roles.all_roles.names
# }


# output "managed_policy_arns" {
#   value = aws_iam_role.single_role.managed_policy_arns
# }

# output "instance_profile" {
#   value = aws_iam_instance_profile.ec2_instance_profile.name

# }