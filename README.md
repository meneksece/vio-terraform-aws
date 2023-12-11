# vio-terraform-aws
creating resources

create_iam_role is to create single or multiple roles with attaching access policies (using arns) 

create_instance_profile is to create instance profile with a role (either existing or non-existing role)   

create_ec2_with_instance_profile is to create ec2 instances with iam instance profile with associated role and with permissions of that role.

create_user_and_group_attachpolicies is to create user and group and attaching access policies to the group.

When creating ec2 we won't be using this since I don't want to create an IAM access key for the user. 
We will be using create_ec2_with_instance_profile for security reasons.

create_simple_s3_bucket is to create an s3 bucket with versioning enable.
