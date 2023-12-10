# vio-terraform-aws
creating resources

create_iam_role is to create single or multiple roles with attaching access policies (using arns) 


create_instance_profile is to create instance profile with a role (either existing or non-existing role)   

create_user_and_group_attachpolicies is to create user and group and attaching access policies to the group.

When creating ec2 we won't be using this since I don't want to create an IAM access key for the user. 
We will be using iam instance profile with associated role with permissions when creating ec2 instances.

