# Data source: retrieves the latest Amazon Linux 2023 AMI for the current region.
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Data source: retrieves the current AWS account ID.
data "aws_caller_identity" "current" {}

# Data source: retrieves the current AWS region from the provider configuration.
data "aws_region" "current" {}

# Data source: retrieves the available availability zones in the configured region.
data "aws_availability_zones" "available" {
  state = "available"
}
