

# Create an IAM group
resource "aws_iam_group" "example_group" {
  name = var.group_name
}

# Create an IAM user
resource "aws_iam_user" "example_user" {
  name = var.user_name
}

# Add the user to the group
resource "aws_iam_user_group_membership" "example_membership" {
  user   = aws_iam_user.example_user.name
  groups = [aws_iam_group.example_group.name]
}

# although we can attach policies to the group, we will create the ec2 instances with a instance profile with its permissions for kops 

# Attach policies to the IAM group using for_each  
resource "aws_iam_group_policy_attachment" "group_policy_attachments" {
  for_each = toset(var.policy_arns)

  group      = aws_iam_group.example_group.name
  policy_arn = each.value
}

# Create an IAM access key for the kops user
resource "aws_iam_access_key" "example_user_access_key" {
  user = aws_iam_user.example_user.name
}