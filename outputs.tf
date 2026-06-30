# Output: VPC ID for the created network.
output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

# Output: Public subnet ID.
output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.public.id
}

# Output: Private subnet ID.
output "private_subnet_id" {
  description = "The ID of the private subnet."
  value       = aws_subnet.private.id
}

# Output: Bastion host public IP.
output "bastion_public_ip" {
  description = "The public IP address of the bastion host."
  value       = aws_instance.bastion.public_ip
}

# Output: Bastion instance ID.
output "bastion_instance_id" {
  description = "The instance ID of the bastion host."
  value       = aws_instance.bastion.id
}

# Output: Application Auto Scaling Group name.
output "application_asg_name" {
  description = "The name of the application Auto Scaling Group."
  value       = aws_autoscaling_group.application.name
}

# Output: RDS endpoint address.
output "rds_endpoint" {
  description = "The endpoint address of the RDS instance."
  value       = aws_db_instance.main.address
}

# Output: NAT Gateway ID.
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.main.id
}

# Output: Internet Gateway ID.
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.main.id
}
