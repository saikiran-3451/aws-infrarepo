# AWS region where the infrastructure will be deployed.
variable "aws_region" {
  description = "AWS region for deploying the infrastructure."
  type        = string
  default     = "ap-south-1"
}

# Short name used to identify resources in a consistent way.
variable "project_name" {
  description = "Name prefix for all resources."
  type        = string
  default     = "aws-infra"
}

# Environment name such as dev, test, staging, or prod.
variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

# Team or individual owner of the infrastructure.
variable "owner" {
  description = "Owner or team responsible for the infrastructure."
  type        = string
  default     = "platform-team"
}

# CIDR block for the VPC.
variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

# CIDR block for the public subnet.
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

# CIDR block for the private subnet.
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

# Availability zone used for the subnets.
variable "availability_zone" {
  description = "Availability zone used for the subnets and resources."
  type        = string
  default     = "ap-south-1a"
}

# EC2 instance size for the bastion host.
variable "bastion_instance_type" {
  description = "EC2 instance type for the bastion host."
  type        = string
  default     = "t3.micro"
}

# EC2 instance size for the application instances.
variable "app_instance_type" {
  description = "EC2 instance type for the application autoscaling group."
  type        = string
  default     = "t3.small"
}

# Existing EC2 key pair name for SSH access.
variable "key_pair_name" {
  description = "Name of the existing EC2 key pair for SSH access."
  type        = string
  default     = "my-key-pair"
}

# CIDR block allowed to connect to the bastion host over SSH.
variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to reach the bastion host over SSH."
  type        = string
  default     = "0.0.0.0/0"
}

# Desired number of application instances.
variable "autoscaling_desired_capacity" {
  description = "Desired number of instances in the application autoscaling group."
  type        = number
  default     = 2
}

# Minimum size of the application autoscaling group.
variable "autoscaling_min_size" {
  description = "Minimum size of the application autoscaling group."
  type        = number
  default     = 1
}

# Maximum size of the application autoscaling group.
variable "autoscaling_max_size" {
  description = "Maximum size of the application autoscaling group."
  type        = number
  default     = 3
}

# RDS instance class for the MySQL database.
variable "db_instance_class" {
  description = "RDS instance class for the MySQL database."
  type        = string
  default     = "db.t3.micro"
}

# Database name for the MySQL instance.
variable "db_name" {
  description = "Name of the MySQL database."
  type        = string
  default     = "appdb"
}

# Database username for the MySQL instance.
variable "db_username" {
  description = "Master username for the MySQL database."
  type        = string
  default     = "admin"
}

# Sensitive database password for the MySQL instance.
variable "db_password" {
  description = "Master password for the MySQL database."
  type        = string
  sensitive   = true
}
