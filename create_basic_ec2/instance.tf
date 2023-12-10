resource "aws_instance" "myec2" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.AZ1
  key_name               = "ect-key"
  vpc_security_group_ids = ["sg-08be11322872e4328", "sg-0da013698941ff354"]
  #iam_instance_profile   = var.existing_ec2_instance_profile # existing ec2 instance profile which was created with certain role including certain permissions needed for kops
  tags = {
    Name = "ec2-ect-instance"
  }
}