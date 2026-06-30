# Auto Scaling Group for application instances running in the private subnet.
resource "aws_autoscaling_group" "application" {
  name                      = "${local.name_prefix}-app-asg"
  desired_capacity          = var.autoscaling_desired_capacity
  min_size                  = var.autoscaling_min_size
  max_size                  = var.autoscaling_max_size
  health_check_type         = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier       = [aws_subnet.private.id]
  target_group_arns         = []

  launch_template {
    id      = aws_launch_template.application.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${local.name_prefix}-app"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = var.owner
    propagate_at_launch = true
  }

  tag {
    key                 = "ManagedBy"
    value               = "Terraform"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
