# AWS Infrastructure Terraform Project

This repository contains Terraform configuration for provisioning a production-ready AWS infrastructure stack in the `ap-south-1` region. The design includes a VPC, public and private subnets, a bastion host, a NAT gateway, an internet gateway, an application Auto Scaling Group, and an RDS MySQL database.

## Architecture Overview

The infrastructure is organized as follows:

- **VPC**: A dedicated virtual private network for the environment.
- **Public Subnet**: Hosts the bastion host and NAT gateway.
- **Private Subnet**: Hosts application instances and the database.
- **Internet Gateway**: Provides internet access for public resources.
- **NAT Gateway**: Enables private subnet resources to reach the internet securely.
- **Auto Scaling Group**: Runs the application tier with scalable capacity.
- **RDS MySQL**: Provides managed relational database services for the application.

## Folder Structure

```text
.
├── data.tf
├── locals.tf
├── main.tf
├── provider.tf
├── terraform.tfvars
├── variables.tf
├── versions.tf
├── .gitignore
└── README.md
```

## Prerequisites

Before deploying, ensure you have:

- Terraform `>= 1.6`
- AWS CLI configured with valid credentials
- An existing EC2 key pair for SSH access
- Appropriate AWS permissions to create VPC, EC2, RDS, and networking resources

## Getting Started

1. Clone the repository.
2. Review and update values in `terraform.tfvars`.
3. Initialize Terraform:

```bash
terraform init
```

4. Review the planned changes:

```bash
terraform plan
```

5. Apply the infrastructure:

```bash
terraform apply
```

6. Destroy the infrastructure when no longer needed:

```bash
terraform destroy
```

## Variables

The project uses the following main variables:

- `aws_region`
- `project_name`
- `environment`
- `owner`
- `vpc_cidr`
- `public_subnet_cidr`
- `private_subnet_cidr`
- `availability_zone`
- `bastion_instance_type`
- `app_instance_type`
- `key_pair_name`
- `autoscaling_desired_capacity`
- `autoscaling_min_size`
- `autoscaling_max_size`
- `db_instance_class`
- `db_name`
- `db_username`
- `db_password`

## Outputs

Outputs can be defined in the Terraform configuration to expose useful information such as:

- VPC ID
- Public subnet ID
- Private subnet ID
- Bastion host public IP
- RDS endpoint
- Application load balancer DNS name (if configured)

## Notes

- Sensitive values such as database passwords should be supplied through environment variables or secure secret management.
- Review AWS resource limits and costs before deployment.
- Use separate state files or remote state backends for production environments.
