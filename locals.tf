# Local values used across the Terraform configuration for consistent naming and tagging.
locals {
  # Environment-specific prefix used in resource names.
  environment_prefix = "${var.project_name}-${var.environment}"

  # Standard naming convention for resources.
  name_prefix = "${local.environment_prefix}-vpc"

  # Common tags applied to most resources for governance and cost allocation.
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}
