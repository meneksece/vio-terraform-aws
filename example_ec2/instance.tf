resource "aws_instance" "myec2" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.AZ1
  key_name               = "ect-key"
  vpc_security_group_ids = ["sg-08be11322872e4328", "sg-0da013698941ff354"]
  tags = {
    Name = "ec2-ect-instance"
  }
}