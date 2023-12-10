variable "aws_region" {

  description = "AWS region"
  #default     = "eu-central-1"
}

variable "aws_availability_zone" {
  #default = "eu-central-1a"
  description = "availability zone"
}

# variable "ec2_instance_type" {

# }

# variable "ec2_security_group_ids" {
#   description = "security group ids"

# }

# variable "ec2_key_name" {
#   description = "ec2 key name"

# }

# variable "AMIS" {
#   type = map(any)
#   default = {
#     eu-central-1 = "ami-088e71edb8795252f"
#     us-east-1    = "ami-067d1e60475437da2"
#   }

# }


# variable "existing_ec2_instance_profile" {
#   description = "existing ec2 profile with certain iam role to provision ec2"
# }