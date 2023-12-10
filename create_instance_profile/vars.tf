variable "aws_region" {

  description = "AWS region"
  #default     = "eu-central-1"
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
  #   default     = [
  #     "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
  #     "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  #     # Add more policies as needed
  #   ]
}

variable "aws_iam_role" {
  description = "Existing AWS IAM Role"
  # default = "ec2-kops-role"
}