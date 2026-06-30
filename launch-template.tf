# Launch template for application servers used by the Auto Scaling Group.
resource "aws_launch_template" "application" {
  name_prefix   = "${local.name_prefix}-app-"
  image_id      = data.aws_ami.amazon_linux_2023.id
  instance_type = var.app_instance_type
  key_name      = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.application.id]

  monitoring {
    enabled = true
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_type = "gp3"
      volume_size = 20
      encrypted   = true
    }
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${local.name_prefix}-app"
        Type = "application"
      }
    )
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-app-lt"
    }
  )
}
