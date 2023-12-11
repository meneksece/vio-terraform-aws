

resource "aws_s3_bucket" "example" {
  bucket = "vios3-state-store"

  tags = {
    Name        = "Cluster State Store"
    Environment = "Dev"
  }
}


# #with versioning enabled
# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.example.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

# output "PublicIP" {
#   value = aws_s3_bucket.vip-s3.public_ip
# }
# output "PrivIP" {
#   value = aws_s3_bucket.vip-s3.private_ip
# }