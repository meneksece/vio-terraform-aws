#assume policy
data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# data "aws_iam_role" "existing_role" {
#   name = var.aws_iam_role
# }


data "aws_iam_roles" "all_roles" {}