resource "aws_instance" "myec2" {
  # count=2   # you can create 2 or multiple ec2 instances with this count line
  ami                    = var.AMIS[var.aws_region]
  instance_type          = var.ec2_instance_type
  availability_zone      = var.aws_availability_zone
  key_name               = var.ec2_key_name
  vpc_security_group_ids = var.ec2_security_group_ids
  iam_instance_profile   = data.aws_iam_instance_profile.example.name # existing ec2 instance profile which was created with certain role including certain permissions needed for kops
  tags = {
    Name = "ec2-for-kops"
  }
  user_data = file("user-data.sh")
}

output "aws_instance" {
  value = aws_instance.myec2.public_ip
}

output "aws_instance_user_data" {
  value = aws_instance.myec2.user_data
}

# here we don't use resource since it tries to create a new profile, instead we want to use an existing profile
# in case we want to create an instance profile, either we use "create_instance_profile" or we can simply MOVE this block TO THE TOP and uncomment it
# resource "aws_iam_instance_profile" "ec2_instance_profile" {
#   name = "ec2_instance_profile"
#   role = var.existing_iam_role_name
# }
