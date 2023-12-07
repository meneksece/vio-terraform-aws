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

