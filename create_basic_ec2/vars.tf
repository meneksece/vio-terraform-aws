variable "REGION" {

  default = "eu-central-1"

}

variable "AZ1" {
  default = "eu-central-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    eu-central-1 = "ami-088e71edb8795252f"
    us-east-1    = "ami-067d1e60475437da2"

  }

}

variable "existing_ec2_instance_profile" {
  description = "existing ec2 profile with certain iam role to provision ec2"
  default = "ec2_instance_role"
}