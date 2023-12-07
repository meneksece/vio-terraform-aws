resource "aws_instance" "kops" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.AZ1
  key_name               = "ect-key"
  vpc_security_group_ids = ["sg-08be11322872e4328", "sg-0da013698941ff354"]
  tags = {
    Name = "ec2-ect-instance"
  }
}

output "ec2_complete_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.kops.instance_state
}


output "test_ec2_price" {
  value = aws_instance.kops.public_ip
}



# resource "aws_instance" "Sonar-Server" {
#   ami = var.AMIS[var.REGION]
#   instance_market_options {
#     market_type = "spot"
#     spot_options {
#       max_price = 0.0031
#     }
#   }
#   instance_type          = "t2.medium"
#   availability_zone      = var.AZ1
#   key_name               = "ect-key"
#   vpc_security_group_ids = ["sg-08be11322872e4328", "sg-0da013698941ff354"]
#   tags = {
#     Name = "ec2-spot-sonar-instance"
#   }
# }

# data "aws_ec2_spot_price" "Sonar" {
#   instance_type     = "t2.medium"
#   availability_zone = var.AZ1

#   filter {
#     name   = "product-description"
#     values = ["Linux/UNIX"]

#   }
# }