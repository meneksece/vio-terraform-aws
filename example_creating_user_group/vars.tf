variable "REGION" {

  default = "eu-central-1"

}

variable "AZ1" {
  default = "eu-central-1a"
}

variable "user_name" {
  description = "The name of the IAM user"
  type        = string
}

variable "group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the IAM group"
  type        = list(string)
  #   default     = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}


