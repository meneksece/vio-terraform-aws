variable "aws_region" {

  default = "eu-central-1"

}

variable "role_names" {
  description = "List of IAM role names"
  type        = list(string)
  # default     = ["ec2-kops","test_policy"] # Add more roles as needed
}


# variable "role_names" {
#   description = "Map of IAM role names to policy ARNs"
#   type        = map(list(string))
#   default = {
#     "role1" = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
#     "role2" = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"],
#     # Add more roles and policies as needed
#   }
# }

variable "policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  # default = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess",
  #   "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
  #   "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  #   "arn:aws:iam::aws:policy/IAMFullAccess",
  #   "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  #   "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
  #   "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
  # "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"]
}