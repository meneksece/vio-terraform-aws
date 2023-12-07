terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "vio-s3" {
  bucket = "vio-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# output "PublicIP" {
#   value = aws_s3_bucket.vip-s3.public_ip
# }
# output "PrivIP" {
#   value = aws_s3_bucket.vip-s3.private_ip
# }