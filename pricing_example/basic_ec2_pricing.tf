data "aws_ec2_spot_price" "example" {
  instance_type     = "t2.medium"
  availability_zone = "eu-central-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}


output "ec2_spot_price" {
  description = "The spot price,hopefully"
  value       = data.aws_ec2_spot_price.example.spot_price
}



# data "pricing_plan_pricing_per_resources" "spot_instance" {
#   for_each = data.aws_pricing_product.spot_instance.terms.on_demand
# }

# output "minimum_spot_price" {
#   value = min([for plan in data.pricing_plan_pricing_per_resources.spot_instance : plan.priceDimensions.PricePerUnit.USD])
# }