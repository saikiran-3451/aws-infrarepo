# Development environment values for the AWS infrastructure project.
aws_region                   = "ap-south-1"
environment                  = "dev"
project_name                 = "aws-infra"
owner                        = "saikiran"
vpc_cidr                     = "10.0.0.0/16"
public_subnet_cidr           = "10.0.1.0/24"
private_subnet_cidr          = "10.0.2.0/24"
allowed_ssh_cidr             = "0.0.0.0/0"
bastion_instance_type        = "t3.micro"
app_instance_type            = "t3.micro"
autoscaling_desired_capacity = 5
autoscaling_min_size         = 3
autoscaling_max_size         = 7
db_instance_class            = "db.t3.micro"
skip_final_snapshot          = true
